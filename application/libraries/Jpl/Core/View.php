<?php

/**
 * Contains the View class
 *
 * License:
 *
 * Copyright (c) 2010-2012, JPL Web Solutions,
 * Jesse P Lesperance <jesse@jplesperance.me>
 *
 * This file is part of EternalMVC.
 *
 * EternalMVC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.  EternalMVC is distributed in the hope
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the
 * implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License for more details. You should have
 * received a copy of the GNU General Public License along with EternalMVC.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 *
 * @package    Jpl\Core
 * @author     Jesse Lesperance <jesse@jplesperance.me>
 * @copyright  2010-2012 JPL Web Solutions
 * @link      http://www.eternalmvc.info
 * @license    http://www.gnu.org/licenses/gpl-3.0-standalone.html GNU General Public License
 * @since      v1.0
 *
 */
/**
 *
 * @package Jpl\Core
 */
namespace Jpl\Core;

/**
 * The View/Template class
 *
 * @author Jesse P Lesperance <jesse@jplesperance.me>
 * @copyright 2010-2012 JPL Web Solutions
 * @license http://www.gnu.org/licenses/gpl-3.0-standalone.html GNU General
 *          Public License
 * @since v1.0
 *       
 */
class View
{

    /**
     * a list of view members
     *
     * @var array
     * @access private
     */
    private $_vars = array();

    /**
     * The default constructor
     */
    public function __construct ()
    {
        
    }

    /**
     * Render the view for the given controller and action
     *
     * @todo Allow custom view locations v1.2.1
     * @todo Allow Partials v1.2
     * @todo Change from thowing \Exception to \Jpl\Core\Exception\InvalidView
     * @param array $view            
     * @throws \Exception
     */
    public function render (array $view)
    {
        $folder = strtolower($view[0]);
        $file = $view[1];
        if (! file_exists(APPLICATION_PATH . "/view/{$folder}/{$file}.phtml")) {
            throw new \Exception(
                "The view does not exist for the requested action: /view/{$folder}/{$file}.phtml"
            );
        }
        include APPLICATION_PATH . "/view/$folder/$file.phtml";
    }

    /**
     * The magic set function
     *
     * @param string $key            
     * @param mixed $val            
     */
    public function __set ($key, $val)
    {
        if ('_' != substr($key, 0, 1)) {
            $this->_vars[$key] = $val;
        }
    }

    /**
     * The magic get function
     *
     * @param string $key            
     * @return mixed
     */
    public function __get ($key)
    {
        return $this->_vars[$key];
    }
}

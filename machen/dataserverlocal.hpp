/*******************************************************************************
Machanguitos is The Easiest Multi-Agent System in the world. Work done at The
Institute of Physics of Cantabria (IFCA).
Copyright (C) 2013  Luis Cabellos

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.
*******************************************************************************/
/** @file dataserverlocal.hpp
    @brief Engine::DataServerLocal declaration.
    @author Luis Cabellos
*/
//------------------------------------------------------------------------------
#ifndef DATASERVERLOCAL_H
#define DATASERVERLOCAL_H

//------------------------------------------------------------------------------
#include "dataserver.hpp"

//------------------------------------------------------------------------------
namespace Engine {
    //--------------------------------------------------------------------------
    /** DataServer instance that runs in local proccess.
        @ingroup Engine
     */
    class DataServerLocal : public DataServer{
    public:
        void end() override;
        std::shared_ptr<Util::Raster> getRaster( const std::string & key ) const override;
    };

    //--------------------------------------------------------------------------
    inline void DataServerLocal::end(){
        // empty
    }

}//namespace Engine


//------------------------------------------------------------------------------
#endif//DATASERVERLOCAL_H

//------------------------------------------------------------------------------
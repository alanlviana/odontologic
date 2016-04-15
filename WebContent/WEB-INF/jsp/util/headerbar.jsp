<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="headerbar">
        <div class="container">
            <div class="row">
                <div class="col-xs-6 col-sm-2">
                    <a href="<c:url value="/consulta/list"/>" class="shortcut-tiles tiles-success">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-check-square"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Consulta
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="<c:url value='/paciente/list'/>" class="shortcut-tiles tiles-info">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-user"></i></div>
                            <div class="pull-right"><span class="badge"></span></div>
                        </div>
                        <div class="tiles-footer">
                            Paciente
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="<c:url value='/odontologo/list'/>" class="shortcut-tiles tiles-green">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-group"></i></div>
                            <div class="pull-right"><span class="badge"></span></div>
                        </div>
                        <div class="tiles-footer">
                            Odontólogo
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-primary">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-credit-card"></i></div>
                            <div class="pull-right"><span class="badge">10</span></div>
                        </div>
                        <div class="tiles-footer">
                            Financeiro
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-midnightblue">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-bar-chart-o"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Relatório
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-orange">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="fa fa-wrench"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Plugins
                        </div>
                    </a>
                </div>
                            
            </div>
        </div>
    </div>
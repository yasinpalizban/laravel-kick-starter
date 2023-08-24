<?php


namespace App\Interfaces;

interface ServiceInterface
{
    public function index(UrlAggregationInterface $urlQueryParam): array;

    public function show($id): array;

    public function create($entity);

    public function update($id, $entity): void;

    public function delete(string $id): void;

    public function getInsertId(): int;
}



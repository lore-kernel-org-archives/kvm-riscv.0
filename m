From: Matthew Wilcox <willy@infradead.org>
Date: Sat, 2 Sep 2023 14:59:24 +0100
Subject: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
References: <20230901082025.20548-2-vbabka@suse.cz>
Message-ID: <ZPM/vJnwI4bi9bo2@casper.infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 10:20:26AM +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.
> 
> Also incorporate comment update suggested by Matthew.

In the meantime, 866ff80176aa went upstream earlier this merge window,
so it's going to have some conflicts.



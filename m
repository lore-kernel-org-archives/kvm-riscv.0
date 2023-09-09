From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Sep 2023 17:15:33 -0700
Subject: [PATCH gmem FIXUP v2] mm, compaction: make testing
 mapping_unmovable() safe
In-Reply-To: <20230908074222.28723-2-vbabka@suse.cz>
References: <20230908074222.28723-2-vbabka@suse.cz>
Message-ID: <169421599820.98577.9267896589643015779.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 08 Sep 2023 09:42:23 +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable. To enforce
> that expecation, make mapping_set_unmovable() also set AS_UNEVICTABLE.
> 
> [...]

Applied to kvm-x86 guest_memfd, thanks!

[1/1] mm, compaction: make testing mapping_unmovable() safe
      https://github.com/kvm-x86/linux/commit/4876a35647b9

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes


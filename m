From: Sean Christopherson <seanjc@google.com>
Date: Tue, 5 Sep 2023 16:56:31 -0700
Subject: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
References: <20230901082025.20548-2-vbabka@suse.cz>
Message-ID: <ZPfAL0D95AwXD9tg@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.

Rather than expect/assume that unmovable mappings are always unevictable, how about
requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
simply having that helper forcefully set AS_UNEVICTABLE as well.


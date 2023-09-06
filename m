From: Vlastimil Babka <vbabka@suse.cz>
Date: Wed, 6 Sep 2023 10:00:56 +0200
Subject: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
In-Reply-To: <ZPfAL0D95AwXD9tg@google.com>
References: <20230901082025.20548-2-vbabka@suse.cz>
 <ZPfAL0D95AwXD9tg@google.com>
Message-ID: <bcefb739-b45c-8349-8010-ac137ab61c29@suse.cz>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/6/23 01:56, Sean Christopherson wrote:
> On Fri, Sep 01, 2023, Vlastimil Babka wrote:
>> As Kirill pointed out, mapping can be removed under us due to
>> truncation. Test it under folio lock as already done for the async
>> compaction / dirty folio case. To prevent locking every folio with
>> mapping to do the test, do it only for unevictable folios, as we can
>> expect the unmovable mapping folios are also unevictable - it is the
>> case for guest memfd folios.
> 
> Rather than expect/assume that unmovable mappings are always unevictable, how about
> requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
> simply having that helper forcefully set AS_UNEVICTABLE as well.

Yeah I guess we could make the helper do that, with a comment, as gmem is
the only user right now. And if in the future somebody has case where it
makes sense to have unmovable without unevictable, we can discuss what to do
about it then.


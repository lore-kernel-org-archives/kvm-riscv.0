From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 5 Apr 2022 11:50:09 -0700
Subject: [PATCH v2 0/5] KVM: mm: count KVM page table pages in pagetable
 stats
In-Reply-To: <YkyOJqTeGRUjtuX1@google.com>
References: <20220404234154.1251388-1-yosryahmed@google.com>
 <YkyOJqTeGRUjtuX1@google.com>
Message-ID: <CAJD7tkYqSMk5UO5A46sR1cOviDeww0=JsR6QRMO9ZRF_7NLXBA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+Johannes Weiner  +Michal Hocko  +Roman Gushchin

On Tue, Apr 5, 2022 at 11:45 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Apr 04, 2022, Yosry Ahmed wrote:
> > We keep track of several kernel memory stats (total kernel memory, page
> > tables, stack, vmalloc, etc) on multiple levels (global, per-node,
> > per-memcg, etc). These stats give insights to users to how much memory
> > is used by the kernel and for what purposes.
> >
> > Currently, memory used by kvm for its page tables is not accounted in
> > the pagetable stats. This patch series accounts the memory pages used by
> > KVM for page tables in those stats.
>
> It's still not obvious to me that piggybacking NR_PAGETABLE is desirable, probably
> because I am quite clueless as to how these stats are used on the backend.  E.g.
> why not have a NR_SECONDARY_PAGETABLE entry to track pages used for secondary MMU
> page tables?

We can add NR_SECONDARY_PAGETABLE or even NR_KVM_PAGETABLE, but I am
not sure whether this separation is desired on the MM side. Let's see
what MM folks think about this.


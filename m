From: Sean Christopherson <seanjc@google.com>
Date: Thu, 21 Sep 2023 07:24:29 -0700
Subject: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050> <ZQr5uXhV6Cnx4DYT@google.com> <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Message-ID: <ZQxSHXIGdWXy+zDU@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 21, 2023, Xu Yilun wrote:
> When the invalidation acrosses multiple slots, I'm not sure if the
> contiguous HVA range must correspond to contiguous GFN range. If not,
> are we producing a larger range than required?

Multiple invalidations are all but guaranteed to yield a range that covers addresses
that aren't actually being invalidated.  This is true today.

> And when the invalidation acrosses multiple address space, I'm almost
> sure it is wrong to merge GFN ranges from different address spaces. 

It's not "wrong" in the sense that false positives do not cause functional
problems, at worst a false positive can unnecessarily stall a vCPU until the
unrelated invalidations complete.

Multiple concurrent invalidations are not common, and if they do happen, they are
likely related and will have spacial locality in both host virtual address space
and guest physical address space.  Given that, we chose for the simple (and fast!)
approach of maintaining a single all-encompassing range.


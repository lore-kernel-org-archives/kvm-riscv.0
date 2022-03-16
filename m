From: Peter Xu <peterx@redhat.com>
Date: Wed, 16 Mar 2022 16:53:48 +0800
Subject: [PATCH v2 19/26] KVM: x86/mmu: Refactor drop_large_spte()
In-Reply-To: <20220311002528.2230172-20-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-20-dmatlack@google.com>
Message-ID: <YjGlnDJeSX/wBH6D@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:21AM +0000, David Matlack wrote:
> drop_large_spte() drops a large SPTE if it exists and then flushes TLBs.
> Its helper function, __drop_large_spte(), does the drop without the
> flush.
> 
> In preparation for eager page splitting, which will need to sometimes
> flush when dropping large SPTEs (and sometimes not), push the flushing
> logic down into __drop_large_spte() and add a bool parameter to control
> it.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

The new helpers looks much better indeed..

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



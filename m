From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 18:17:55 +0800
Subject: [PATCH v2 09/26] KVM: x86/mmu: Move huge page split sp
 allocation code to mmu.c
In-Reply-To: <20220311002528.2230172-10-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-10-dmatlack@google.com>
Message-ID: <YjBn0w54kLk1eDT/@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:11AM +0000, David Matlack wrote:
> Move the code that allocates a new shadow page for splitting huge pages
> into mmu.c. Currently this code is only used by the TDP MMU but it will
> be reused in subsequent commits to also split huge pages mapped by the
> shadow MMU.
> 
> While here, also shove the GFP complexity down into the allocation
> function so that it does not have to be duplicated when the shadow MMU
> needs to start allocating SPs for splitting.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



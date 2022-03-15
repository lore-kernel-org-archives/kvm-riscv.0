From: Peter Xu <peterx@redhat.com>
Date: Tue, 15 Mar 2022 18:39:11 +0800
Subject: [PATCH v2 15/26] KVM: x86/mmu: Update page stats in __rmap_add()
In-Reply-To: <20220311002528.2230172-16-dmatlack@google.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-16-dmatlack@google.com>
Message-ID: <YjBsz/V7FLsNkNh3@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 12:25:17AM +0000, David Matlack wrote:
> Update the page stats in __rmap_add() rather than at the call site. This
> will avoid having to manually update page stats when splitting huge
> pages in a subsequent commit.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



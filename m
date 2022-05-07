From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Sat, 7 May 2022 15:46:19 +0800
Subject: [PATCH v4 01/20] KVM: x86/mmu: Optimize MMU page cache lookup for
 all direct SPs
In-Reply-To: <20220422210546.458943-2-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-2-dmatlack@google.com>
Message-ID: <eb54e7c0-9270-bc9b-d91e-8d0dcaa02a71@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 2022/4/23 05:05, David Matlack wrote:
> Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
> fully direct MMUs") skipped the unsync checks and write flood clearing
> for full direct MMUs. We can extend this further to skip the checks for
> all direct shadow pages. Direct shadow pages in indirect MMUs (i.e.
> shadow paging) are used when shadowing a guest huge page with smaller
> pages. Such direct shadow pages, like their counterparts in fully direct
> MMUs, are never marked unsynced or have a non-zero write-flooding count.
>
> Checking sp->role.direct also generates better code than checking
> direct_map because, due to register pressure, direct_map has to get
> shoved onto the stack and then pulled back off.
>
> No functional change intended.
>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Matlack <dmatlack@google.com>


Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>




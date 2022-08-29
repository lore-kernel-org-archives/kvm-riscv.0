From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 29 Aug 2022 18:19:41 +0200
Subject: [PATCH v5 5/7] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
In-Reply-To: <20220825232522.3997340-6-seanjc@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-6-seanjc@google.com>
Message-ID: <20220829161941.c5bd6azxv7jzpwq2@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 11:25:20PM +0000, Sean Christopherson wrote:
> Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
> different VMs stomping on each other by cloberring the global pointer.
> 
> Fix the most obvious issue by saving the MMIO gpa into the VM.
> 
> A more subtle bug is that creating VMs in parallel (on multiple tasks)
> could result in a VM using the wrong address.  Synchronizing a global to
> a guest effectively snapshots the value on a per-VM basis, i.e. the
> "global" is already prepped to work with multiple VMs, but setting the
> global in the host is not thread-safe.  To fix that bug, add
> write_guest_global() to allow stuffing a VM's copy of a "global" without
> modifying the host value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 15 +++++++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c | 19 ++++++++++++++-----
>  2 files changed, 29 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>


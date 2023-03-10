From: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Mar 2023 14:14:12 -0800
Subject: [PATCH 0/2] KVM: Fix race between reboot and hardware enabling
Message-ID: <20230310221414.811690-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix a bug where enabling hardware virtualization can race with a forced
reboot, e.g. `reboot -f`, and result in virt hardware being enabled when
the reboot is attempted, and thus hanging the reboot.

Found by inspection, confirmed by hacking the reboot flow to wait until
KVM loads (the problematic window is ridiculously small).

Tested only on x86, though there would have to be some seriously subtle
arch and/or driver code for this to break other architectures.

Sean Christopherson (2):
  KVM: Use syscore_ops instead of reboot_notifier to hook
    restart/shutdown
  KVM: Don't enable hardware after a restart/shutdown is initiated

 virt/kvm/kvm_main.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)


base-commit: 45dd9bc75d9adc9483f0c7d662ba6e73ed698a0b
-- 
2.40.0.rc1.284.g88254d51c5-goog



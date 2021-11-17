From: Marc Zyngier <maz@kernel.org>
Date: Wed, 17 Nov 2021 09:13:55 +0000
Subject: [PATCH v2 1/6] KVM: arm64: Cap KVM_CAP_NR_VCPUS by
 kvm_arm_default_max_vcpus()
In-Reply-To: <20211116163443.88707-2-vkuznets@redhat.com>
References: <20211116163443.88707-1-vkuznets@redhat.com>
 <20211116163443.88707-2-vkuznets@redhat.com>
Message-ID: <87zgq36t64.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 16 Nov 2021 16:34:38 +0000,
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> Generally, it doesn't make sense to return the recommended maximum number
> of vCPUs which exceeds the maximum possible number of vCPUs.
> 
> Note: ARM64 is special as the value returned by KVM_CAP_MAX_VCPUS differs
> depending on whether it is a system-wide ioctl or a per-VM one. Previously,
> KVM_CAP_NR_VCPUS didn't have this difference and it seems preferable to
> keep the status quo. Cap KVM_CAP_NR_VCPUS by kvm_arm_default_max_vcpus()
> which is what gets returned by system-wide KVM_CAP_MAX_VCPUS.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.


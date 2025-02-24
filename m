Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B02C021B6
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 23:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pcNuONSXzOq/r04XEMLoiIXHdHRFuPw4FYsnb7XTeM=; b=JQXa1FDpZhmMca
	ScVqwx7j+0f99nvrWI7cBBqMmf2p8BQBkSUredLIQNkpXjIcYxfxe8lN2LpapHb/lV+etcIIMyrx0
	OectX4Gp82q94LGzQYQlhb0vF+iLfHSWNvDtHXo5ESHnoe0yTGndYaP+kWSxAIVKK0VePmkT2LPdM
	9Vmlyr4faRkBzkurpw33q/3fs70U0qqRZCLTJzf8BaY+177eYDcEhYHa4zb/zWm7vT87bsHpovotJ
	42FPfUmRS01AyMpNzLPMEvOLyuoroLcbpPH8Wopwo3sFiTBYWVh6HwaRfJfXHS4NwHrLovHS6xLJ1
	L0njnaDyStDzatI6zcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiLk-0000000FZ3G-2bbe;
	Mon, 24 Feb 2025 23:59:00 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIe-0000000FXuJ-18WK
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:50 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc46431885so16479500a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441347; x=1741046147; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VUFWBiQUtkyxtQjLqO6VHI65Q9aVoo/tjEK11vAPqoc=;
        b=O/259i2+o40P2BZWY1LN65FqqacPGrB1mk5tiHrf30lVGEZQinEwJbOJGOSYkE5I8m
         9ucS72Nc0Rr6oFT/i0gqyWEsYeCeZrbQlqyuh4uFJ9JHQ8ESmlsb33HPLOndT5cDWUaM
         hm+ffjdKbqfoNS67EAM6BxlLFeg0BxBonl/auF9S4WsYJSQVzV+QH8//vuM59/r5qt8O
         7q71Jaw2W5PbqFRWw1goiy0CYCoWDSeBPjooN90gTneuFGpst35R/YLJAYgg7Ke3Kazo
         Guqcmv1AUiuEqJHE7hocFKoHNRBtrF62+hlBl+m0xhcSEzjBrQ5CrdM9xwouZ4upafIM
         JzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441347; x=1741046147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUFWBiQUtkyxtQjLqO6VHI65Q9aVoo/tjEK11vAPqoc=;
        b=VadAJ7ttLYVzYXRslkPwkciqxJVhjWC+/oWlqDDZvwMviAbYgLxpgpBOud0u24sOf1
         nyyWIHsroRo9N6VNlu8gBF863DntRaoZBFyRpDXwID9AC4zROajXM4T+d8T4c8t9c9Eg
         RuRA+6WFfXXyWUEcohitr/6T82Sm0W4MiDYHifDNRhHzHr3wE3JnTwT/CVBs3uGIxdfX
         VU22q/Vklf6ChR/N0LzpsXNX06S8/9AoC7GAfxvi7nyWftfbphBF1G8XdXTKiMQ8/3Nd
         Ot4z+uhybaJdv2I9KyTBCyHOn4En0GFJfnitgyrJU+i9nVqrIJZaxap9NZcxm4EStVr1
         wFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDYi1wa09pIbZJlSolVONO+VASGi5zDv6XkjXexdehSE4bmTVc+gmNFnUJDj6b2i5SeNFduEPAGoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YypX1+Tyu4Y8F9cNf/0bWNvZnWrFk7A/8MrJXvrV3qwerCR6TLq
	Lxk15xunzi06+5rU3Qk2NwIpsc3J0byKlA+P2We/JmU3QwMAvVoqHAVVag96YdDD1/GZfAomZER
	aCw==
X-Google-Smtp-Source: AGHT+IEskcg8NGcMgI3lzGvHxN+7n9pLx0XcpaLq7IsEpPM2kCgPZOpZWimEzcKRut1Ut1sQ02q7DWsQk2M=
X-Received: from pjuw11.prod.google.com ([2002:a17:90a:d60b:b0:2fa:1771:e276])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18c:b0:2ea:bf1c:1e3a
 with SMTP id 98e67ed59e1d1-2fce86ae2cbmr28015424a91.12.1740441347216; Mon, 24
 Feb 2025 15:55:47 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:36 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155548_307855_4197BCF0 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Free vCPUs before freeing any VM state, as both SVM and VMX may access
VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
to be kicked out of nested guest mode.

Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
called") partially fixed the issue, but for unknown reasons only moved the
MMU unloading before VM destruction.  Complete the change, and free all
vCPU state prior to destroying VM state, as nVMX accesses even more state
than nSVM.

In addition to the AVIC, KVM can hit a use-after-free on MSR filters:

  kvm_msr_allowed+0x4c/0xd0
  __kvm_set_msr+0x12d/0x1e0
  kvm_set_msr+0x19/0x40
  load_vmcs12_host_state+0x2d8/0x6e0 [kvm_intel]
  nested_vmx_vmexit+0x715/0xbd0 [kvm_intel]
  nested_vmx_free_vcpu+0x33/0x50 [kvm_intel]
  vmx_free_vcpu+0x54/0xc0 [kvm_intel]
  kvm_arch_vcpu_destroy+0x28/0xf0
  kvm_vcpu_destroy+0x12/0x50
  kvm_arch_destroy_vm+0x12c/0x1c0
  kvm_put_kvm+0x263/0x3c0
  kvm_vm_release+0x21/0x30

and an upcoming fix to process injectable interrupts on nested VM-Exit
will access the PIC:

  BUG: kernel NULL pointer dereference, address: 0000000000000090
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  CPU: 23 UID: 1000 PID: 2658 Comm: kvm-nx-lpage-re
  RIP: 0010:kvm_cpu_has_extint+0x2f/0x60 [kvm]
  Call Trace:
   <TASK>
   kvm_cpu_has_injectable_intr+0xe/0x60 [kvm]
   nested_vmx_vmexit+0x2d7/0xdf0 [kvm_intel]
   nested_vmx_free_vcpu+0x40/0x50 [kvm_intel]
   vmx_vcpu_free+0x2d/0x80 [kvm_intel]
   kvm_arch_vcpu_destroy+0x2d/0x130 [kvm]
   kvm_destroy_vcpus+0x8a/0x100 [kvm]
   kvm_arch_destroy_vm+0xa7/0x1d0 [kvm]
   kvm_destroy_vm+0x172/0x300 [kvm]
   kvm_vcpu_release+0x31/0x50 [kvm]

Inarguably, both nSVM and nVMX need to be fixed, but punt on those
cleanups for the moment.  Conceptually, vCPUs should be freed before VM
state.  Assets like the I/O APIC and PIC _must_ be allocated before vCPUs
are created, so it stands to reason that they must be freed _after_ vCPUs
are destroyed.

Reported-by: Aaron Lewis <aaronlewis@google.com>
Closes: https://lore.kernel.org/all/20240703175618.2304869-2-aaronlewis@google.com
Cc: Jim Mattson <jmattson@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 58b82d6fd77c..045c61cc7e54 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 		mutex_unlock(&kvm->slots_lock);
 	}
 	kvm_unload_vcpu_mmus(kvm);
+	kvm_destroy_vcpus(kvm);
 	kvm_x86_call(vm_destroy)(kvm);
 	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
 	kvm_pic_destroy(kvm);
 	kvm_ioapic_destroy(kvm);
-	kvm_destroy_vcpus(kvm);
 	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
 	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
 	kvm_mmu_uninit_vm(kvm);
-- 
2.48.1.658.g4767266eb4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

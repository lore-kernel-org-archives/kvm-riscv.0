Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B93AE7719F
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW0kpxYjyD9ZrQRlI0r5H+RjeeICSRmOnB9YmbfS4WM=; b=oQR7oxwyOkGPHz
	lqEa1nfgB+fnXC0P93LlmYjJAo5yi9FOvXrEn1FIrvT5mHgd0iydtz+yDPZlqdJFujvsojoYv7lJu
	tzL7H3d5cRzsFuOvxN6o9AAv9RLou9g+rOrWC8SjHny69KkpbSZh2pk4YAk4ooY9I7UQCt0k3FlD3
	KBTHWQQhT/5r9ndsV5wXlNHXdA0YaowMqVBFnyfwC3zQsBCsVH5M8Fxdm/pKAJuss0ooQd6XOJwm0
	myECeAWkFrCKmeAva/SfVoQMBMlgMwwKChraf9lyOF+h+ACb+NAn26kJu25F5tIrz5HDLHgVS8iP1
	O95QUgrZZenBh+V2KUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoO-0000000HRek-3QuO;
	Sat, 11 Jan 2025 00:57:12 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiT-0000000HQN7-1ROT
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:06 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so4764417a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556662; x=1737161462; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=C590g53WBTBH2pglqPV7I0aj/YKCkAN9TTbKfsWGVOceLorqDGvkIJLWyc8tJJfrTR
         o4HrFCnu5TYSoSVv3XOsZMmcQICHSV71ejFYuwXeHKdURoUfRmXkwFyhsX4UfBqT2uoS
         qn8V4ECAuETc1IBZdtMtTdjOAReubE/cBPufozVitqNI60sRlpx4jNP1i7oSFP9W434d
         A0coBi9zQ94MwiUQ6tVDgnSel/2frzretUV4kMQliikYftueLev0/hGCex2QuWbKaIna
         yEehPpez8m8RmJ+Qvj2+xe8odLy+KDVtRnrWanmQ54NcgOf70lr3M+mOvWuXxIuy/yqm
         L0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556662; x=1737161462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=Z/jz87oUYbxsfpLgpdbeK5Nx9REoW0M0EPuZUIw37L/gHlszXGak0ytaT1XdJgP630
         oBlXQYtaGojllup1crEqDr1GWnU7PoYAlhYEPctQhKFIPWGR6LS7DKqWXKBFUIEK0Woo
         yTWkkMhM1OjXR37zVgJSrYcgJbpeLscyNGGMErHd+37lFaT0p4/tZtoX7vxmw75OgZI8
         BRCLGHgbWPaJt2D0gT9kl440N2es+PaPxB+08Ba2POQv4yg11J4yYVOjWB4b0OXKMosh
         LFdC4L/HOLuvIBKQoYlXkOAeSPLqJ8Shp3UzeU8Pr5e9DJJlyRI2HVMKxj/XdtM9JW2x
         VEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2w9sucGhSkgge6BFmHpFy1NONx5AdzqCV0joxRN17FGTQxDscxUlsviN/DMLaUJSc6LikhRMivLk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmsYvE3HiDKo84Uoyj8GX8o91tatbEK/yrLad1Rb5UgoRS6VU
	H1fgTFcE98uReuCYK+eE/hffE4/8lEuA4gp0GvPCHkBB6u68yZX+31Lkn4rE3zGB7tEVQD1LEo8
	IMA==
X-Google-Smtp-Source: AGHT+IGlLX0aEPqXGbQsPjSqI3Z9q/GgP2EA9enACEq8PUpXduEFLRvRbXw1OHEj1+uEtI1vezl+E8v1zzM=
X-Received: from pjbnw2.prod.google.com ([2002:a17:90b:2542:b0:2f4:4222:ebba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c5:b0:2f4:423a:8fb2
 with SMTP id 98e67ed59e1d1-2f548eca27emr18806754a91.20.1736556661971; Fri, 10
 Jan 2025 16:51:01 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:46 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-7-seanjc@google.com>
Subject: [PATCH v2 6/9] KVM: selftests: Get VM's binary stats FD when opening VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165105_380277_0607C35D 
X-CRM114-Status: GOOD (  12.04  )
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

Get and cache a VM's binary stats FD when the VM is opened, as opposed to
waiting until the stats are first used.  Opening the stats FD outside of
__vm_get_stat() will allow converting it to a scope-agnostic helper.

Note, this doesn't interfere with kvm_binary_stats_test's testcase that
verifies a stats FD can be used after its own VM's FD is closed, as the
cached FD is also closed during kvm_vm_free().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c88f5e7871f7..16ee03e76d66 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -196,6 +196,11 @@ static void vm_open(struct kvm_vm *vm)
 
 	vm->fd = __kvm_ioctl(vm->kvm_fd, KVM_CREATE_VM, (void *)vm->type);
 	TEST_ASSERT(vm->fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm->fd));
+
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vm->stats.fd = vm_get_stats_fd(vm);
+	else
+		vm->stats.fd = -1;
 }
 
 const char *vm_guest_mode_string(uint32_t i)
@@ -661,14 +666,17 @@ static void kvm_stats_release(struct kvm_binary_stats *stats)
 {
 	int ret;
 
-	if (!stats->desc)
+	if (stats->fd < 0)
 		return;
 
-	free(stats->desc);
-	stats->desc = NULL;
+	if (stats->desc) {
+		free(stats->desc);
+		stats->desc = NULL;
+	}
 
 	ret = close(stats->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	stats->fd = -1;
 }
 
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
@@ -2231,7 +2239,6 @@ void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 	int i;
 
 	if (!stats->desc) {
-		stats->fd = vm_get_stats_fd(vm);
 		read_stats_header(stats->fd, &stats->header);
 		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5AECCF9FE
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teatN5WGS6WfZhORLjZNvi+D4uWdmsko+DittbcwpFQ=; b=WaFFeD5L8CIDtB
	oXAH91i3RqqwSSXZLucNy08AKpGrQmIvGfeTt+5zAkponIf2U7uIu/QTQmjQSA4Ornht/BHbcjqx+
	DL59vqjehY3DvT3Qziu+Y6DZ5jOtI+m0EupsHVqYzmbsw2K7G9TgetddxRFtsBiPXNDx3fF0K77gK
	zBWrdXSqPtpkEzBgzBtwt+PRW+IaejdpBgqEiz6QfGcsccZE2FuwDyITOMO4zJ+Vls7BNpEF9I3pt
	iM1Mz4NU8mqx/7MatuhyybvviiYnmoFzFaaXi2Y+fvs+OwYyFABwhBOOvAVISd15ndWkQXtfKbHsY
	3AxjwG0NxC4zUpf5VgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ0h-00000004mIk-2XZc;
	Thu, 30 Oct 2025 20:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz3-00000004kHo-1nef
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JvdyzKJX9NuDfCF42GsCtwlMI06iCRR0AAdHR5FNyUo=; b=ZAEuuBCBN42onXf15605EKWMyJ
	Bc7tlKgCPKKSaAKRtbNR7fU0ZQOl6k/K0pgk1ewHjCD9usTO+yEHPE3FyT5LtUnqb+ygb2bu7Zgq2
	F2HSumC1bbjgDTtwtXW2khOG90nzsjlTNmgtBtyE422U7Db/9xwwMEJH6+i5SDbSR259qcMZqHYoB
	wwaqrZK/QJm7w0WA2FXBbrTTMK/60ThbGH3mv4WlW+HJ67/3WnliJI4ZWcYBPsCaP7+L/refTCQTi
	kKLceg9+2zb/olLzQv3SsaV4yrzz5Um+Vh7Aa9p6eS5iJbvewHB+j1OZuHYEmxxOH6/eR5O73Mj1u
	GHfa1daA==;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7G-00000009tvL-0c0L
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:24 +0000
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28bd8b3fa67so12820255ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855050; x=1762459850; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JvdyzKJX9NuDfCF42GsCtwlMI06iCRR0AAdHR5FNyUo=;
        b=tOm6BjWKf/BF425RsbVF//yhdb5Ti/RqfiB+luC7f/XJb5S7ft+wRy3UILll9FNaON
         XF40Gi3MZfSjV5pyd4uPpzL1ynocd8L5d5St6dWFYBOu3RnWLq4GgyjX3j7HGZ34emZy
         v1vcLq60jGDO7n329s6YPaNfX0KGpSQxrF6lmTVt92Hquiw7QN3ak+Lt3ZSp7lh/98s8
         Nmr+CuiEeodks09z0ZDyWSEOtRyjKUEXPcl9QIXxBZtC0X1wuAWuPaDVpmBgWzXgvKhv
         I0mvs4B27Fqnsp0mGU/uYZhNyXMR0s94BCFSFOsHS+aB43rN+qFOL37AOf1l9e2Zgn3B
         QYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855050; x=1762459850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvdyzKJX9NuDfCF42GsCtwlMI06iCRR0AAdHR5FNyUo=;
        b=L9jULzJidYmdqn9vTHml1gnp8O8NTkICwqGHx24iE+hTzIULgDmKbHd9SPiY6jQhiT
         AsgUkHao4rsMIyWXVDC9XG2NdYmrOvJO7wPupNxRJGZyA+QG58pK0FasptgTt/zMlMJ5
         LGO4THbo/+sav+87qLQYg6O2fBzlUlJQojuOsglkRthVI3sOjgpwfH9NuNmRK20/LCPH
         Yvf5Ez5eikHC0vLeiMDxZerVj7mN1bQ2b/Xuaoh0r9hgior6TMSos7QRb8Re9+9ydvgs
         CU2YlBnbPLdjkc14HlhNgXYGc4o6pXK5+1X8ORIZ2o0H5IOoupyX1ZhWHv69MeWRR3Qx
         fTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+2TVBxXMOl+lUNphdqU4yB7JfLrhKX9u7pbixMR2l8HA02w3+e3EQqRloTFJK3YcMtuub+Xzo7/s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcI4rvb0ZNN71j8iEcwNLdvD4fw5Yd3+WpLXGSR4n66uX2q71
	AMUuscM9QwjfrGwYEvgHZbvJ5ZLL9t7EmS7MWLlPEgX3IKjusN2iLBK6z/PsSt+UI1dDR2Dcst9
	5Ul2vaQ==
X-Google-Smtp-Source: AGHT+IHEVTdCFV7pO4/z6pVQDy8N1YwVBneIfEZO+ruu2Aqfbau+04/y/mG+hlEqHWjdepdrmBSAOEyDdTs=
X-Received: from plge18.prod.google.com ([2002:a17:902:cf52:b0:290:d7ff:80f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:38c8:b0:294:fda6:4723
 with SMTP id d9443c01a7336-2951a6007f3mr12024995ad.60.1761855049987; Thu, 30
 Oct 2025 13:10:49 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:43 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-21-seanjc@google.com>
Subject: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191522_236355_477C27AD 
X-CRM114-Status: GOOD (  10.45  )
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

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
the conditional assert in tdx_track() as well, but with a comment to help
explain why holding mmu_lock for write matters (above and beyond why
tdx_sept_remove_private_spte()'s requirements).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 63d4609cc3bc..999b519494e9 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
+	/*
+	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
+	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
+	 * tracking epoch hasn't completed.
+	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	err = tdh_mem_track(&kvm_tdx->td);
@@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

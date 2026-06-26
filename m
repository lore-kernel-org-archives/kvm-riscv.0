Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F54CDE008
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5zjx07xe1D4SJJC3pUOQU5IaUeUHKWioKbgY0znqWU=; b=1HA1gXTb/MTZ01
	CvcqQp3IG40j19lJ2bQHFJtx1c5g0/Nv/iekRvW0SlhGJonq9iTHbBrMr4M7AA+FpG3Y+kshgCnVc
	sRRII1E9IT+goU2J46OpYxgu1jguhRPg4nG4KLpQcqJMWercF8qMuxxnQ4EYU9MvlBMQMi7Pc5m2N
	SQI6v0Fgnr5+DJW4Nyt/UppD6Al6VEuVXNToJW67gzcmiwyKH8ABXeHTjduY5ueLh9WlqIQYunUN9
	OhWsovUtdTNqir6/jz/HVjFmzeDInI0ff+XtGvWcKc6pKJKzG1BXdDRjNhCdLxt7H/2phbCQC4V6+
	FWgG8fEBMD1m3eEzAaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r2-0000000Aqjg-1c7I;
	Fri, 26 Jun 2026 08:24:04 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qz-0000000AqhB-1j4D
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:24:03 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1390f75d8bbso613266c88.0
        for <kvm-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782462241; x=1783067041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=iVKTR/6BBSxVsdFuf1uPVtw/2kFU6Wlj3pnQFGN9sbzcbABlJgF6VObRu2If1MSOM3
         Kxz5OPf4sXlmeLw+Cj0W8v73B9rmO52oLg3h71uc+aug8VTp1TGeek5ZUMeuRBHxXPwe
         0Tg0vVVV74mHFrxssrQUBMAVj3B6eGR8gIWEXQsYSNUhI6xl+S25REMTOYqBgFU4meej
         YcZ3vDUmh7ndfCX1nzuSsCmX3qDJSyozJy82OPV0bC7CT9TINtsxSchRrUYKGoPh+njH
         WU/VVlnhneiYhi0XENdmLUstw5I7HFYx+UIp6aIrvlUuk2yEgce2UK3jrFB02UXICV0i
         /7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462241; x=1783067041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=JHI6VP2ZX5MRtdVvPUWNBQ9fowqmhyaoT0ZU11nf3gB/eU70IfxNM7NUt2r4gbU7km
         F6nqiOAhRN09sptC5skg2Zx9km3dDelXZQz58m1furqb5wvNrhDszE3MhQNtNAdSoBc/
         GKbntb+POTdL2x5eRtF+tQKovIy4y77o9Nat3k1vUeid+oHTyaAoF8GVwNES1acnh6B9
         tmwFVO7XkV/SCuQhOSGCgtQAZkfqhmV+4zDjMem9Sa54oPyHbBdC4L5UFzRKrbmL0G4J
         1KRdrKafhddr779I6RtStDH3oLDwcH5080TgOr4U08we8LVexS5UDJAlvP994gnm5oBC
         zCZA==
X-Forwarded-Encrypted: i=1; AFNElJ95R3LFbBenlOuD59dQeIJ5BuTDiAaW2WzNcke96cHVRqxDcmpDE3s1IkCRn68N6/W+sjhU9uFbEv0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+NHYXMHzxpPUrGiTfyeKHlzszmNJimtxdSsgrDdiBRW36w9z
	9XlMnm4b5u5T0LmE1Kps6xos3eYDIpMWKTio0WOEyjED7TWAf0bJiF8l5S29lWb6PDQ=
X-Gm-Gg: AfdE7clGg7RvNoUOyn45umCYLp0PFF8ewlRj9rqfoczynhf5edu/ZcikKHT7trZrqc8
	NpVeDE1DcO4W3xXfHRpyTRNzz8hc36efZXV9ErqLmv0sGuJXkXWOrUGs42UHfaUSP06cC6sjW9x
	TwwTbFuI++qv+yAXu50pTF/qUvv5AOci/wFTzu/D+MvMhBf2cNyySfkldC0wwrAexQr441z80bf
	jxtHK6ev26CuAoicaPVjQfR6dSs3ex1KCnEQv9dGjmHHPr3Pdl9Hmrc6rKqhnR+5D0AjSOvA6gF
	3iuro1E1RU/tcYleeXZ5P/l4hDYinIVfTmvzmRAs9ix5zTAUFmWBMExcRr3xpctQcgPPm6VXdtk
	b8RmB3npkgwAZy2FkT0eAESHHRjxBKlL7+mFQ+iyyc4P/EkIg7ayvWpXmu5fWBFCHeNxsle3sek
	nGl0lCgRhiFarLEr5nvWQ1C3qCnowbHAsG
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr6090271c88.18.1782462240516;
        Fri, 26 Jun 2026 01:24:00 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm15557199c88.3.2026.06.26.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:59 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 26 Jun 2026 01:23:21 -0700
Subject: [PATCH v2 1/2] KVM: RISC-V: Clear former VCPU cache on
 virtualization disable
MIME-Version: 1.0
Message-Id: <20260626-kvm-cpu-pm-v2-1-478e5ef8dc9b@sifive.com>
References: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
In-Reply-To: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782462237; l=2593;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VCtdpA7YF5advtu0bupY3qxS+FfCYS20j33S3YKJEL0=;
 b=PLsuyWmTEcgztSc4jAigjlQNrBKATP06+H1C5DMVQ6nyjljp9p0vtpvzJiWdtN2jkenD9DYIc
 v2Jc5qMTS2+D+On88Jk0ju4NdP5P1vHLUHdxSAETIrJn4I7SmX333Ra
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012401_466217_C2C7F581 
X-CRM114-Status: GOOD (  11.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

When a CPU is taken offline or enters deep idle states, hypervisor CSR
state is lost. The kvm_former_vcpu fast-path optimization caches the
last VCPU that ran on each CPU to avoid expensive CSR restoration when
the same VCPU is re-scheduled on the same CPU. However, if this cache
is not cleared when CSR state is lost, the next VCPU entry will
incorrectly skip CSR restoration, leading to corrupt hypervisor state.

Add kvm_riscv_clear_former_vcpu() to invalidate the per-CPU cache and
call it from kvm_arch_disable_virtualization_cpu() to ensure proper CSR
restoration after CPU offline or system suspend events.

Fixes: 1323a5cfe52c ("KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 ++
 arch/riscv/kvm/main.c             |  2 ++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec9d2..808b4ee1bd10 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -319,6 +319,8 @@ bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
 
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_clear_former_vcpu(void);
+
 /* Flags representing implementation specific details */
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 0924c75100a2..350e4f097d6e 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -69,6 +69,8 @@ void kvm_arch_disable_virtualization_cpu(void)
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
+	kvm_riscv_clear_former_vcpu();
+
 	kvm_riscv_nacl_disable();
 }
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..e48338f907f4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -26,6 +26,17 @@
 
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
 
+void kvm_riscv_clear_former_vcpu(void)
+{
+	/*
+	 * Clear the per-CPU former VCPU pointer because hypervisor CSR state
+	 * will be lost. This ensures that the next VCPU entry will properly
+	 * restore all CSRs instead of incorrectly skipping CSR restoration
+	 * via the fast-path optimization.
+	 */
+	__this_cpu_write(kvm_former_vcpu, NULL);
+}
+
 const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

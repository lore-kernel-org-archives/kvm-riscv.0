Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19FCDE013
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5zjx07xe1D4SJJC3pUOQU5IaUeUHKWioKbgY0znqWU=; b=j5h8XFzk7tkgEf
	PqkFSQf4mYg+iV6s/yWQvgbEemnB19AV2OAssGj0xZqHhMZBCAKL8SG75f7eHL8IS3UFHdagTeUqT
	773Pn1BYUzQRxw5sCfMNmIOkfjh8Xc+litjTK21v5h6l7yWN3RllPsXpiu0JUkeowrOz0H0+zJHsR
	ie+q+jAT+70CiCkIofDg9vEb1ue5Wx6nqFT6h5aLM3KnFbKCk4VDgCm5I98LU31/uSzMIVDZtiqSG
	ygQUtw6iyBR4hq7NmWlr06yDVi6LbGeJKzbO8QBjOXPSYBQ6Ru3yZrhpn88g6rBwEb5UYBOPWqPwP
	RUQm7xF1xMKbZGHTyW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd31D-0000000B02C-2vqH;
	Fri, 26 Jun 2026 09:38:39 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd318-0000000Azxw-0cJ4
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 09:38:36 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-13809223fd4so933257c88.1
        for <kvm-riscv@lists.infradead.org>; Fri, 26 Jun 2026 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782466713; x=1783071513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=ndZTDaPRVCY1GHwGakrx6VLKJ03s32s5IxW6PNEJ8JlTxnFwyKmaMo9/tHdurmzP9u
         hdTC9WtbWqnY0mAj0xeKPJ8I3CyXnns0u3J552LPCuCnAwmilZcdAhZF8AkAvfScPz0l
         l8uik3VTLH4bLemYG4lVBeLUUgP/7JFABtKhpnnTEGNbjLcQC0c4RyYvlFSL4XAh3Dkd
         QmXiAokI4LPlG91PsV97S9iHe7eLU+ZF4nO88KqzwicmEVcRPjlDKnpz8nEEG4r4foD/
         uzPwuHON6vC7pwFctwArqWLsr4JuCrQqncQ0QkRmnTXbItXi3UYAxXYp2isdysk62K+n
         5sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466713; x=1783071513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8TjMER5gISFlQ4SyOMczlZr2aeQOkgr25LHVZl1LkM=;
        b=kvQxJn5HSfCU2qA5a1ZJA6twRFCanCGs44E0PqbVCZlG2jU+HUPYbiyUoAU0ChR+Sb
         9g2Hx44/UbiXT0eM5pw1UqHTtfb7npr+a/3wASeyYHECY0fJqk4SF8kTHO+fCEZ5VCRE
         BAxfLcV/PI7o3y9ipDNUjG9SC0y8eX1sgRkp2cMtfTHDfGLsoimgd8U+xJvpV5EL5hMo
         obB3bJu8HR0MmicOsdRUKeqGpx38uHS+sjfhN7yFH21xCmoQHEC33hhvl/Pjbe7HIGBD
         agsuGwWZwfo+PzSHSRVCNeN7YCi9ecYCV5aw4NM/8nFVf4wml1jF7qnNGsLDb9wsXgus
         EIqg==
X-Forwarded-Encrypted: i=1; AFNElJ/kfySpBhBJTGiqL1YgHa2rQFRQO470y2K8r9xmKlG+U3kBy41bc8zq3pk7gsYug42GM4H3SHhLocY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPiHgu3eRCzjPwXg6fZoskjHjd/cyVz4jJPeUWlj55UEr3JKL5
	iiiqAk/gZJ0CAnlpbqoFbUibzXdsAxecLbxGQsyfQ1dmAGeIUZK5mLrIgctE5nUvZ9k=
X-Gm-Gg: AfdE7ckJxdETTJDhd9sJ8iU1v0u/75V3yghC/ZzvZbTiXVarQjKKV4MLXtrvJgEseTP
	IEn/7O2ovQ6/Og0FRVnCnkuMphTVCHsVXRdHyfJh40nOKfrBynZKpSBQ/VNzm0zesOP9BKZMHVx
	0fxhHOSpQnV8I2R9qv818QQIuPZtctx8Kzdt+csgqa2TBlWtthXL4YD00E3P62E248L1JvyPp5R
	A5Bc3x92xc+arJeAWFUsd1pxIMoyGKiLFoxh8mMKlurqwBOWTOtW25T6TrqQvs8SRAKZmGASsa1
	tsuPTZ+ivZgaaRQcHhaoIHySzzdVkHWZooCZKhgj1D0MfWNgOlzXqlu/HHz5BCAsiIX4hsECFQB
	J7UdqZSn2HJt3k1m4Bm8bpntSIRyNtGOek1x1FkIxupoamK2u24KvcYJw+YGEutbWoxqVNjRsxA
	TRQP1Ns5hWdiL4xrv/8CKouedZz4RmoYVy
X-Received: by 2002:a05:7022:490:b0:138:56d:27e8 with SMTP id a92af1059eb24-139db9e5f9dmr5069305c88.1.1782466713362;
        Fri, 26 Jun 2026 02:38:33 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm24350302c88.11.2026.06.26.02.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:38:32 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 26 Jun 2026 02:38:29 -0700
Subject: [PATCH v3 1/2] KVM: RISC-V: Clear former VCPU cache on
 virtualization disable
MIME-Version: 1.0
Message-Id: <20260626-kvm-cpu-pm-v3-1-be051aafe9ba@sifive.com>
References: <20260626-kvm-cpu-pm-v3-0-be051aafe9ba@sifive.com>
In-Reply-To: <20260626-kvm-cpu-pm-v3-0-be051aafe9ba@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782466711; l=2593;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VCtdpA7YF5advtu0bupY3qxS+FfCYS20j33S3YKJEL0=;
 b=gABi8lzOetGuxw51Lf0uhej0g392dXy4e7CM6VbjOU/dkev0xdI8lX0iGGOxQIdNqovdvGyZn
 l6zDJEOHmzPAfiH5032VomfJS8xfQK2kmgcDwpwJDD/1yQNuV5o7R/l
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_023834_442813_6200577C 
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

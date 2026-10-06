Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D499CA5FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=phqDd3grdQrH9cEZExC2aaO38mecWI62A3fz3kbpNSk=; b=qX3rB4Ew2dkr7M
	+iqq+VwUxt/veM93za7rdrHk6aUP1o3vo1Vu10/nByJUE0Klww6KswHznb9PhzwOCwza1YyGi+bnL
	KKTGJAAy8I9iVbZc4rKD1CqjWy95GDA5A3WR0tleZKOp4Jl7BBeFouFmeHKcY4LhrX2ar63cGgLrz
	Wy2nmvGPnAV68RzR4rZCw2kZyKs1xpAH6mqxUwC40XRpsq78jLu0k7sVaLlpUW6CuubmFEswYyTRH
	1DDe9oE7lzm8hAV3K0yeTQUmdV4eOU9pI9SQ63xbhWPnccQ/DVZX0RNUQfNEn6wl1VM/j/CclxvxD
	V1OYkuYyoDtT1gFuqU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEke-00000001VBo-3UNR;
	Tue, 06 Oct 2026 23:39:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEkb-00000001VB2-0loM
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:39:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2945957f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791329951; x=1791934751; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=WQs2Fg+c+Os7Xc+3upPep4M/Q41/GYihan4ym7XzNuifVvbKzdfw0L9trMSxV4LKdz
         k0PW4j69QrygdHJhuK33W5sjIK7IFEOJbHWdTjOy456epj1VZ6+6/LZ0rX+kafGDbd9l
         /quKD/mb8YLn8+qplmfbAhRivFvnS9MhmCuxlHP1Y0utazRXQ2LbJDnlgeRAfpam/3Z7
         bIIIDAX7SrkWQSo8mdG+64zx3BtrYCxpeTnBVeWiULmtuYay/N8K4V9ePF7YgtRQV33H
         QZYzsQFsELs9miKAB9x1s3hOZ/RxnAVpUMNrwYmtjO/enTj5m/I2Mw04hwcIyw8XqjZg
         GcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329951; x=1791934751;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p6vQUbClVDpSCeEbk4enL4LsUUIDighbOrvskTUgMlI=;
        b=To2A60H7m2A0XXMJ4skjiErPvm44cCcDVp2MIhwK59QK4E1mgXznHCh3MiIu5lfpau
         tm2xWaLlGK7B7a2OpvAjsuzYj7/ZjiZY08+VR+AK8fUfxAbA1BXMNMJT3m0ny0B39D+V
         MCkrxeX5qP/O4Rh7yE/159DI7Xypirim8DxzPOian/d/kvvU/WFB9zzo0LvsdSGdj1F1
         +dP01pZuUUGsK2tjaLK9IXo7Dur+SeB1LmdoU59jJeQzdcBgTTf6+F9lbnphDEsOqgqG
         wKbOaVQSy28l/9dLRN5UTE4N27aM5OKxfgAaLE+BVc3NQs/bBdWxKsPS1JV5y0VXUQON
         o3nw==
X-Forwarded-Encrypted: i=1; AKwUvByxhVzM+gdEkIdvzdKR3hVNBUb+/CfatqEJ8E58mXxSXyqRKkK9hfFKx9Z4DaEnc6kiZJnFt1YA9tQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJLRRM0LmWpL50Pe/5VL0HYBbuqmWjPI6jv6gFjDo6HHhVoG92n
	vmj5V2tzsilJKZuMs1Muog1mP5pNEpX5LwBm4nUu0m7949lNE27vmul2
X-Gm-Gg: AYBFou1fTQ1JO12QbE9COq+C5dDobqFLApfa3TNxNO//Vob/atOdheSB3SmVph263mr
	7FDzUVfAgSKxpiidmUm5QXwV5nZiVZSEOrRDmPZVvBWm1MLeNtEc/CBfAiCRDwLO/pXem/ej3Tf
	MKCK1Jyq5zxcrCYQVt7b2samCIW25P4wDU0G88FKwkSQa3uEDEN1F3WNPiHtfsbE6b8zvGiqPg2
	lCu6PXlwDUAr//EgNXAjD+B706aeq/dKOGnQU6W2CalXv53wKFVi2A7VU51cMioA4rZTduK7euf
	xxb0okE7gFzxzBI2NpY9aYjQ6biXU5cUKOzmzd7j9B2iUpmbeX5hGVuaF6VmGc84sJbdWk1mfSu
	kUoXDe0ZnfZasWVbL98U9GERXBCkw/esB4s9UEow41l88Hs+snJbBZripGQebc9KmarR1e0vBKU
	OQQgODvpgFuGTLoG00Z9ai5e/cXZofpiQV4hB3ngJB9UMYtCuRfCgLbYGNlSQm4VU5BEXhZ7tB5
	71dgRw3hBtzidQTmFKRlfP7HhCE6xLYKSGj91XyAcfzlZ7ggi8LAEpa
X-Received: by 2002:a05:6000:2585:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48c72889ca6mr1289357f8f.22.1791329950735;
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10216sm1881368f8f.20.2026.10.06.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:39:10 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 06 Oct 2026 16:39:03 -0700
Subject: [PATCH] riscv: KVM: Fix compilation when CONFIG_RISCV_ISA_V=n
MIME-Version: 1.0
Message-Id: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QpAMBRAf0X32WqjFn5FEtsd14NpYyn5dxeP5
 9Q5F0QMhBGa7IKAiSL5lUHlGZh5WCcUZJmhkIVWUmqR0Ow+9N653tEp6rKyWo3K1VIDR1tA1t+
 w7X6Ox7hw9F7gvh+hxdj4cgAAAA==
X-Change-ID: 20261006-vector_off_fix-938d61b1f906
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791329949; l=1885;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=BWQi6+OUEp/tu9l1mkI7xW4X2+ly+BWbFk1Zcp5roxc=;
 b=fIJD49rfeAewk1vKo3AGACkBEa31o13TCmZF61L5MsBbstc43N/TbELEyoRMR0rhStTq2fWGD
 hT5PT2sRkL+B6oSNnlTW2Mo4/PGgShIdVRbZ3Yn5vuC3tmu1dzV+Rzw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_163913_254526_F51BA1DB 
X-CRM114-Status: GOOD (  11.13  )
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

Fix the KVM code to use stubbed out versions of vector functions when
vector is not enabled instead of failing to compile. An alternative
approach would be to ifdef out the vector code but since a handful of
the vector code already just uses stubbed functions to tell the compiler
to drop the implementation, follow the same pattern.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
I was reviewing [1] and noticed that when I disabled FPU and tried to
compile that vector got disabled and the kernel failed to compile.

[1] https://lore.kernel.org/all/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..1c9efc6048bb 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,14 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+{
+}
+
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261006-vector_off_fix-938d61b1f906

Best regards,
--  
- Charlie


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

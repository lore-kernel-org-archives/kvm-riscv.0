Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D373C3ABB9
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k4F7nqfIuI3MSl3+LkL8Pj6l7s0MszaFJNBlJadkTmg=; b=uGxNh0a6esZ5iL
	qnkcnDLFrHZH8QRJGiUgEfn9q8CtCAo0PNY9X/q3jWc4FJ8VwRKo9XZlATo/iEQ7Fv2ohj07+l7Ti
	3MvoLA0oiQZEbHV5ezm+jNP83JAif6jMk4GJToelW3Euhee1S0pF1HIY/Pal/sD1p4Ts+u2czH8xC
	fL8YT9gt1MpjfgZXVY6Tg7daiUXtnvO8CKbTyOeIfH+adZB8C/99w/YEb5zHcnv6Nxe7da1qcNCB/
	9vXV7JVWYFgUMrsKfVHQ4VET1Afv2kclvIQKL0LmA+/xLvqB10ijeAcaGFLK9Jtg9JY0LmXQ2wLZ5
	ThoroKmCNRvZSnJyBfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1mJ-00000008RJQ-0kFV;
	Mon, 05 May 2025 19:47:03 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1mG-00000008RIq-3nzN
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 19:47:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so4366042a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746474419; x=1747079219; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=PxaX3OmEljzE7zT2yLlbMvvD6sJRneHXUZk37ePU7aXQ92NlGy3JN1kvG/Qp3TCexu
         OufsVs/+snz0Do07UJVdNPgoX0mr8Z921k8tlpBjL3Ma/VEVU6ibhA5XaaNWIXrRMn07
         XSoQyVMTRoUWjjcwSdomUx8HkFgnxSeDQC8HkoATIXGUUt7GUCaAPcIe+d31xw35cRFi
         lp/tMO5zhGWTWVt99FY2Al6+k+2h0UcRxLRjIc9MV1Lkj349yIJk0Ct72IZdLz4iqCBc
         L9QbngijW1sAcEev+ayOX8VGT2+gG29lvl/gdvbSUcMa61Ij8mNI7YQQFmbbRPbI95O+
         vv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474419; x=1747079219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=Ld44Cze9R2sfbOtdNCXQkbx9Msoz4RMZHSvnxZ0TDlFEtMiVtu+1FeYzTVxeZtSUJh
         BeVkb7MzJThCF5uWyXzjBOyQh93FBIc/+u05Fe7zeT50/xONuaJidBhEiZrViKVMf/eS
         tdOpIM1SmoRV6wha1dTG5dbmHMAPLG3Zd17jtK5h347lXsLlXakD0L4MuqDnHvP21s3O
         ekOJgKN7+BwfoYxy5wmvm4iu0654vpYx1V/dq0fV+EN53m+Ixpw3SGFy0mZuqvwIXmIN
         eNcB3MGSyRaGGU9xPxADrbvxFUmmdzK/4dv4zGr23Yw+lSjY6uS52lDjqtmg35lKa+z5
         IeWw==
X-Forwarded-Encrypted: i=1; AJvYcCW+iemOhAGkgZVH6fhZNTKUGX/oDLH0y6+BQRlr5HFtZYO0ybsmfUF2RBtnePLW/j9V8BwW+slONNM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmv2fMjdOC59uat4oBoClhVUqwKh1fznlEtyMzdvygHoVYCeKF
	OhOSujCk+zI3Wk19/NZaeNuYsQPyFReDb+ZKnp52dfmVp3axNCH1GBuuWyI6M+E=
X-Gm-Gg: ASbGncs4eKjh+HhReePdPNnlia/GUqVa/HCLDS0u3324boAPPkaGzjSTPcjEHnSEs6j
	NxUjuRf+7xGHFn/6yKmwIH4c1zlg/fFTcufIV5QYyVBRqStCKzZVH0araP4cC77hTJt6Ft/M7fH
	4Br2MWEBEQmHUmSYrYhcJsIG01sCkwnCtucJhNPfPvD1eFtHU2/32r6Lpj00c6Dael6qF5EVnNP
	CBw3GJoWBADTWyRk9QiYhxzK0S5gZXcHlz8wGOzJuqF7c5nHDsukoZHVnOZIgahdj7U8HY3pJMf
	uaOERTAEyD3H2j/mUaHTNpdLxDau7kyPiPWUVHq2rfDpiZxq1XvEug==
X-Google-Smtp-Source: AGHT+IF9N2TMIjAxtdrrQ2QWC7apsZXf1n2ya4YvkWtGuqNlHbY6PxtJ98wUVfZSK5UimT5DfxWc6Q==
X-Received: by 2002:a17:90b:2744:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-30a800a11cfmr172541a91.31.1746474419573;
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ce9sm59083085ad.163.2025.05.05.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 12:46:53 -0700
Subject: [PATCH] RISC-V: KVM: Remove experimental tag for RISC-V
MIME-Version: 1.0
Message-Id: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKwVGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINTNLsuNL0lMj4fKpqQmGpkYmxomGpuaKgE1FRSlpmVWgA2Mjq2tBQA
 HM59HYAAAAA==
X-Change-ID: 20250505-kvm_tag_change-dea24351a355
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_124701_150251_34B35225 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

RISC-V KVM port is no longer experimental. Let's remove it to avoid
confusion.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 0c3cbb0915ff..704c2899197e 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -18,7 +18,7 @@ menuconfig VIRTUALIZATION
 if VIRTUALIZATION
 
 config KVM
-	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
+	tristate "Kernel-based Virtual Machine (KVM) support"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING

---
base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
change-id: 20250505-kvm_tag_change-dea24351a355
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

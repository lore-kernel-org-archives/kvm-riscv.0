Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE23C61DB2
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbAE7ro8MXPj3gcwiRsH6T2i8UE2ztSZ6tm8Q/9wTr8=; b=uzirtC2C/lTHt0
	TEkf1EwRdouUXNabsvCEqHVemt5W3eGQnhob6TsPaZ3Ex6FZ+CFfwLBXZIVPy3qX7/yajYXwTB3P6
	yAbfd/bLGLfgLj81D+E3+yOyYeXE/+WM19zDcHiknFLR7qu8GctO7TFDh9TRnkEkEVsx8bLf0gRUf
	acvuiwd01IhRENGdXlzS9j+vfyQpOzOEC4LUd59vnfKoK/M4xgy3deWlZQAfO7aclb/pC6JdiCKxm
	MdDpZd0X2SEinCUTiA4Abc03NaNlborlcp/SkiIX++1Zjsjr0r3Ve4AgZ8OTlhorsfn/rEzJSXrxs
	+7npMwwYctZRzi87FBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMU-0000000FXFT-00hv;
	Fri, 13 Jun 2025 06:58:02 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMS-0000000FXEC-0gqC
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:01 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311a6236effso1587610a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797879; x=1750402679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=N9m4m7ZLyrBUAvZ3+0u2ShdRDcvXl9o1VD3dhW9Wg459lMbcLMhJqwK9fx71Ii6q07
         /jU1bZqjod85Jgu6BWZ6HgHyw0Hyw34qkexGoKMQgIy1WcmfFiDPmpbLMbMvAN3Qpfbl
         cngsuAaJ6CUexP8mQwkcd+y9fcEFysTky3XKIHQZDj/PaxAmDCbwzKA/vJ7JY3l7Ov+s
         OEo4MIUu/EuTHKKxTHAS2Aed8ONr59d/j//YLns3CI+syWDpwLHBPGDDszBsYGg48J/E
         GQ1ojTw0A9zG5yjK4mbLPt6hN9Hkgdw3dhJvxI81IOa3wQ5sUAL50dt1Vn8iHFoCRhuI
         GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797879; x=1750402679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=LZq5gRbBEMN86ZILnKpql6zLvp/n5lSoedeQY8H4li2E6kxgdwtmMDk+OCezFg41xU
         EtubZbiGjnvU5iw9//WWmiwzR88BCydRseNH3E8h61OxvuXBK3P2pbQ4iTbKplLJrlRc
         wnroYXXBVCsShVozFHRiAYv+R3YWAyJKw0waSaAKtL03GHgP0XhOFypPWbFMrx5f4c9I
         3G8rK4S3K1k33jMcSwrL/mv62qyV/TbXaV167JhRmL8/9yfTHfxU8yNTRzzmmviLoSUy
         ivefU2vdL7AM4HGTF7rPYWsKloO8Mw+d4Gf6jXHUZrOWo5yQP0MxTr9C/4Pz9Nht0Afg
         XMxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfjFHnHKYR2SqJcYULZ3VMUQofXLWtWXJL0ALowM69SpAtKNMnThKxwHPsialh7RqH2VA/NeR6WHU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2acG5Vt5JqTUIAhwr+6enouoAkwoJQmKapPxaidFwpH+BUvM
	cp8Xoy1NMhjGQPzToEx8YtgHZ0F5xvhDy1LuYSiOyGGmBF52V+TRkBRSR8PRi9NC35RNBB9u2dt
	DAbhI4OQ=
X-Gm-Gg: ASbGncsngnPxcMA+cFb1eMp1H9vkVStwekSVCmRT7ADD8H2CfQQh/0CE8pvp+F6OeTy
	VBuPedgWzZ8NV78TqXCbTFyX6dAGO5XtxGcBipM4jP05LL3uNxGe1+TDQWrXbou/R89RNb5VEvT
	TaQNh6R/+MIbMBrhNKUf+qz4JgpLemAKVOa8RvPlyKsDNH9cuzUaI4/qLQRyeFhNnmUPslp2R4Y
	siM08pvcSvKiy0t003/hJJVxt9aljIDAXHwAgx7kHCVh+WRCmWKILO6tcFB4OTka3w6iNH1Iids
	nqE5z7nrbN+0/d8Vju9+fwvmMi9kzBKZWrJ8LYml6DsWkVcJPT9mhB2CMagzKog4J62PvWyUUVE
	EGSVcKUfPaP6BOjr2OjQ=
X-Google-Smtp-Source: AGHT+IFbsRijVxYSu1XTO+0N6i4HTy+vctiYUi4v1qHZj513C6U95CzPutsxwPcR26VA49ZdTmRG4g==
X-Received: by 2002:a17:90b:1a88:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-313d9eeab31mr3207474a91.30.1749797879252;
        Thu, 12 Jun 2025 23:57:59 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:57:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Fri, 13 Jun 2025 12:27:32 +0530
Message-ID: <20250613065743.737102-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235800_202224_5C091B43 
X-CRM114-Status: UNSURE (   9.98  )
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

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 303aa0a8a5a1..b467dc1f4c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

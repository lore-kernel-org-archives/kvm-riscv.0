Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D39C36008
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXbhtHzYMkir09O/f5ZJYkLduwfLZ9W9tQF4PWX4z4Q=; b=lLFn6i8zkgcDL0
	WQaeBCtVEvr836/DDNBoMJGtcblq26igZ/zNKN4A3PpHeJoMnwxwvj3cRd4ruVLvBwih333X2xeWU
	/QhAanMyvjE9JjvW4aqxM4DhwyCb3kQ007uPSxyPGUSQoGBUNqVUpc3NnTLRugIiSTjYONoDdZSYA
	/uKVqlqRuFpcAMKAm0oJLlepan/oy+xGgNkouPNfxHgjIih2y5pZpJYtZe44JmceHNwHXS8BdQHMA
	KRElraU79Es9l+96MJUeqx4tSJyCf/RxLdujobDc9mZWQ/LjdW2Io6C918pivfvy3u3IEFnumaRwz
	EFkeZgDFAi+SArTTPvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKib-00000007iQ0-2GKA;
	Wed, 26 Mar 2025 06:58:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhR-00000007i3t-3Hyb
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-225477548e1so125778975ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972237; x=1743577037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=mB1gUGiETd6ghT+un/D3Vyv0Bq0vVOrdx4n0UJ67nSYhcMeSj2hnA3Lc0uLX5TBxpJ
         LErjUNHhfC5ZN3Wm2Yt9oE9cioqaa0lYOociNJWeLtvc4vdBh/sEd/cSDzgColQxhuKH
         fPILkFWZTfgD+Ta/+MNml+i467CzIpyy2smILmrVlgByUJMvtjFwtM6MI9p2cLHMvrJv
         mVG9fXQMtpIOE76840vAA5Mh8mhH1cUpdiFJfCKRwXx9u9NC2SxnU1IoxRvHoZvodsN9
         ABT10gynLvI5Z5EjKnbKDREqpKSCRGE21ifBCbxzw/6qXa7VL73k2dEBkqbFpJaK/Bet
         AsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972237; x=1743577037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=MwhcOwdCFfj8/dkbGOB94IYCqyI+zyk//F4xg/RE9uGGX+mE3eK2rKgiTvvMgvGdRg
         dpevfP00mVz0r2VlVGG6e4WOf6NadS5W9xwsmXhFOmzyk0fjF2bk4h4mKu4YfpgLsf0r
         AVP8xAMCngscMLe0O3VVEKOJFqUVc36Krm/fZlfJFyJOaRnRjUDYdRAmhff4Mi3Px6Am
         /cvng08zkb4Tp4ZmjrfxV7tjvgFfU+QDTD+L0JOfUX1WpJAIRoSpsh9bPvuvjU0z6M5G
         X3/xyEWHyFwga6tDiFHcyOBiGqfTZftOyFoC10zmlyJD0t8tovonPPUBKkUdc32F2vCc
         CcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2FvJenZxKaRhYEJEd8q1SC21pul0PG8lGVDs9wsKkvDd+2W09WXD6bUGAA2PKHP0w+6HDygFVFdM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyxOlI4j9DlTAfePcclTf/Am1tf2xlpKxSU47ZNeXHdgrU+O3Y
	Go+G8HmsNTxUZ4QyRMpz2bDhFnFX3S/JYKWGzEOe+qztjAdcdqqszrHg5nFUPOw=
X-Gm-Gg: ASbGncteQAkIYAZsF3ErHMcWFOvcWKLZuRceX51sG6Nx6PbSPHoBI1XRmyr/4mi0BXN
	PwMBdlxRtHzZZAxotuNlXoUdysKxg3sAvcGDqs5c8jrdgaSrjHNGulKxbZwQwrzQTXn+eOS3mwS
	DWQ9fxniW6QdP5UNjifvdj+L1tve4Elf2PGJg5cOJ8NmqfB42lrDIo4TryzQFKZYFmXR43InZmo
	tvqeBDoAcQqoZns9fT7lbIcgRuIlogPkBd76bHCgFbehwE8wUPqBXbl6/TcCMFp1nJu2BPJjuX0
	9LSHDa+9OTET9PgUOQn/TXi+F9B0gYFpCUujuNCph20hjJC8RWcAL8o+ervU82zf1Bi5DqqKXs9
	zv8uAffWldwJ8V2pX
X-Google-Smtp-Source: AGHT+IGuMr6un5BMFt7acfamIOQ5qad6lUuhEqtX8+veIxEaoNVnhVBSqdim6LjqJMmMoNsGVYVLjA==
X-Received: by 2002:a05:6a00:1812:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7390598df4emr26325730b3a.4.1742972236720;
        Tue, 25 Mar 2025 23:57:16 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH 06/10] riscv: Make system suspend time configurable
Date: Wed, 26 Mar 2025 12:26:40 +0530
Message-ID: <20250326065644.73765-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235717_821771_279ECB95 
X-CRM114-Status: GOOD (  10.69  )
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

From: Andrew Jones <ajones@ventanamicro.com>

If the default of 5 seconds for a system suspend test is too long or
too short, then feel free to change it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 ++++
 riscv/kvm-cpu.c                     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 0553004..7e54d8a 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -5,6 +5,7 @@
 
 struct kvm_config_arch {
 	const char	*dump_dtb_filename;
+	u64		suspend_seconds;
 	u64		custom_mvendorid;
 	u64		custom_marchid;
 	u64		custom_mimpid;
@@ -16,6 +17,9 @@ struct kvm_config_arch {
 	pfx,								\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
+	OPT_U64('\0', "suspend-seconds",				\
+		&(cfg)->suspend_seconds,				\
+		"Number of seconds to suspend for system suspend (default is 5)"), \
 	OPT_U64('\0', "custom-mvendorid",				\
 		&(cfg)->custom_mvendorid,				\
 		"Show custom mvendorid to Guest VCPU"),			\
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index ad68b58..7a86d71 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -228,7 +228,7 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 				break;
 			}
 
-			sleep(5);
+			sleep(vcpu->kvm->cfg.arch.suspend_seconds ? : 5);
 
 			break;
 		default:
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

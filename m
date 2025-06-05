Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00B1C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TG6hUpqDEpjBjRl7ffyBx6Hj91FW74et/Qs0JYjaTos=; b=LEhcLq++lmP88T
	zY9p7YcxQkQYkS+ecPoh3dhh6pQAJwRAqfjsXeMCT6FRYhREBa0dSoyAzwdkQ3K3RabkAbucGFhwb
	QR9w3NMGZYZLGQC9IBAVEDM4zSHVZkNmLqg7iOEHRyMIFvEfQM3fkC98BUl9+l4pFqyrAw7HfhXof
	wRTFuI66rKqEIX+tyT70xiitJM/LuIp++WZ2n27ef43HntmCyMXMKHtkrTuysnppaJwsVcLRo/mT+
	iTwqoSyx5EhiK8mylnqcjkVxl0LlAk3RTk+6sA9JMy0JI7HSea8PRZ39tu6REE8AXa/GWhK/FjdFs
	iOMAotDsF+jyFFMPDmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDIC-0000000FzwW-0lle;
	Thu, 05 Jun 2025 16:18:12 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDI9-0000000Fzvp-1r8n
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 16:18:10 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4a52d82adcaso15212651cf.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Jun 2025 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749140288; x=1749745088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bcQy7gPSkBnevmxMbb5LF8ShmOv1KLO/XGyCnpQumw=;
        b=Vw9TL7TCwtUI4wlm7TxuPgJrx9RlwUEYUiQy5kZUeroPNd7PeI7a2KGY4f5U2z3SbW
         5RY4glctFmiK86bJ/+qi36coYIQpLfSYZMS3U3J68A/K8nrWVcWoT1BwJ3sOg9EI+Mso
         bfDJrH0UbhgNFyFMgioAQenj3/KQsWfrKA371Cv/bj1aYa+mNfLOfT8qBO6JxEARFZL4
         ljoRO2ZZqNmA5Hdp62TaA+4GcBIypp9eWGyJhQPjm/eVYhRAv3xJM62QJ2FI8kO//PTT
         B9RKUc1xLM2+BwstGo2UQGXX7rALpaKvT8rK2wgYuhtOnBoIwxNv2BPZ7EiFM651F9hq
         fGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140288; x=1749745088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bcQy7gPSkBnevmxMbb5LF8ShmOv1KLO/XGyCnpQumw=;
        b=Kl4nENPDkjG2fUAFJppyC/Afi9L+3yvvajJBvc44HeucxgpSQpEHl0WyWG8vnH4VSt
         /VHpZ55JU8HYN+v545eoehH62ONqM8Wb1/VWak8I1AFoF/Sc04jNTBJhR7W9n3lL6ccN
         hlwqkuFb1gPQnYHGn5mRXD2oAFu2YpB/0WcyaJUD0sBAZR3B5w0Mc2F2y6zHdlpvwI5q
         CkcLhc2ABvV+/hL3PDkjG+CpCAqWIDpjR4kPuhYbDsa1e3TvUjlaSUmWl9qupXjwqA2G
         zT0uTYSvWbp6VBnZJo4quuxoAcr0f3MRaSBUoE6+zuo+lMHiUYnxLCdHNwV1vB09/MbW
         vN0A==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ilg8v3X9FNMlPLDmM7WNjMKtMCi+WG4tWZeCJyqegdayH/KWsskU07lh4eD1cWng33vi23zNSuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/sWCiWo8yZ+4p95Mah1Uhu6XV/s2wTxXqQZAxpm/zl0INcMN
	eDhJaeKiloh054/GLkhgwKpRdypUuOQl/LTpbOSBfZgw/hOMcLmrXJ/iX6lPiANpPn0=
X-Gm-Gg: ASbGncuYc6UMuR8cjruGkTiD2tiGTNTbMCSzgYOWVbXnylIg3sw4fe5CqXUJb7GK+gl
	Nx7SKogklEohHaXboTfbrYLKQQMI97O7neDc///29YM0uPsB42RXn5TtPoGZjK7STTIBc2Obnbt
	p0EtRkyFI6poH8mjP4WuF8ZCPGPfdnHod3IfvJTTHU0es05lhCpAE3YIMv3+O5NShUZjrnA8Vc1
	TgKwok3VMxNDpmy+S2YViWvowXPIpPubsisKnx3ioKhouXYsZ6f0E66olJQZlBT6d+Hukc+SP0n
	DRVLUHzD3VEgG89UICTEAMqUFWAEpKdGchBeI2gnP75WUI28boYjwqbH8RQRSKiJpLJ24nAS2Yq
	4dhPGJC1UUeqxqCEpdrkiOQQE/v03E4QDESE/Lw==
X-Google-Smtp-Source: AGHT+IGagtTXHkeQ0OodJZSC8xG5sdbF/6dv3bvtybwawwSAoeJrgu7/hP6ErOxbMaXTuJabouxgmg==
X-Received: by 2002:a05:622a:551b:b0:4a4:22a1:dab8 with SMTP id d75a77b69052e-4a5b9e0048fmr6122691cf.11.1749140287803;
        Thu, 05 Jun 2025 09:18:07 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-224-24.bstnma.fios.verizon.net. [108.26.224.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a8435esm112334771cf.78.2025.06.05.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:18:07 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v3 1/2] riscv: Add RV_INSN_LEN to processor.h
Date: Thu,  5 Jun 2025 09:18:05 -0700
Message-ID: <20250605161806.1206850-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_091809_712542_EB278711 
X-CRM114-Status: UNSURE (   7.92  )
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

When handeling traps and faults it is offten necessary to know the size
of the instruction at epc. Add RV_INSN_LEN to calculate the
instruction size.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/riscv/asm/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index 40104272..631ce226 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -7,6 +7,8 @@
 #define EXCEPTION_CAUSE_MAX	24
 #define INTERRUPT_CAUSE_MAX	16
 
+#define RV_INSN_LEN(insn)		((((insn) & 0x3) < 0x3) ? 2 : 4)
+
 typedef void (*exception_fn)(struct pt_regs *);
 
 struct thread_info {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

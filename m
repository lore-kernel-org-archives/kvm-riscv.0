Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5766FC369D7
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucwwpbeFrjS6LY1pbe7T+uKHjjJ6tPbhar4ucLC8Yiw=; b=W5W1uPQXNROaNy
	KZAQ+a28SJFUC34UbNml665xPIfsNRuegyngap4v/SHQLg/62/uG3d2VR80z14pz91xotwgsXhznG
	eIHfE5gQChmOmO8tnRlnR4jdZIaAYqDUIuDC7r4o9UKh3ooPtdQ9yWClhJRIdRuRhBWncjCNtZcVv
	vu8FDScHEolyGnr3FqEKUTCs6wAY4l01eZoFeWYKDFfPfuWvvJEnjgF1MVJXzPCPCucQxEPBd7pXL
	04/G9umQU9l0Yqt9YfdH45XlZqN501Ru18Z1c2eyga7m9zFqQtg71JMC41ZlXUGwYAwKtIosBfH6y
	Qhe5P3COaqk/YUEJ+LVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VS-00000006TCj-0KEn;
	Tue, 22 Apr 2025 09:01:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78yM-00000006J2h-30cd
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:27:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44710585e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310437; x=1745915237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=YIswWcphALumu/9UWgwGc39defr2P3+VLjNVw0RBxnzfE3ibWHXmEWT7QlL3jgBB1p
         0aWS9DbRw0knYIfqbrmD3wARiV+h268pqMQhIM7bo3NMvkHbyjS4xQmWnEHpFtqipnZQ
         0I5ufhWQ1lr2O2x2CvBnnmOJ9F4xmd2U51KMBUUXCQY2Bds2LV+u482Hj8qe9nvrjmXo
         4otPedZ+ChHPa5QqphY0NyQ3/04Z30PPKz+JZS9bT5Im5xEbYWGwAMo7/xqnPfi5ZGOB
         IKWWKL8XCsM4ULlI9rUrQavFPKpwrOgvjW0iQeOyMsddA3cXYwVijvPgD5G3DMQhXrMG
         M75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310437; x=1745915237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=XRo4dT9tcDmjy7ZnCFK6ohHl/w25jJ9EiHhoWKuvNg2xw1bONM2OBOQ2MN4lTwP2Zo
         xKuIzunFbFfcxPOSzWYVIw8rRYlS+aK7Z3R0KGzwS3NK2wsscbO1W+5h5lTm/k5/mJtD
         svthUGA/8Vhz5g61M9xXKsR7TYQ3WI4iUET+zyVkrc4NbxK+yxcJNejitNY0OJQiKWfJ
         n7qE3HkyVStQgoKhuwKk+77ELhIosND2ICgvHn+FF5bcYWPhI35eBoDWe8S+1hb2waTD
         Uk0TVuUfK2AHT+3Yh3dylgwcbBIosOyUsO57/wUflytBxGTmjzkRZsNlUr3Y0wb+kx/7
         stiA==
X-Forwarded-Encrypted: i=1; AJvYcCV/aKgUU4JK/M1B8JeuXzm8aG/Z0iPtsZV7RmcyrTlVxZ4Cg4Khjx/kf88Ad4RRaA84CSZERV8qSis=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz27iEH8yphc5+tqoe1WDM+Jrz0tZhnEdu7vYfg9SABq7bj8/hI
	LPguQxDef7+Gikq2hJn+UuEd9q0fn9QOG0lwPERAyuvG3cYUG7apITd7vFNxwTc=
X-Gm-Gg: ASbGncvq+WwY8tYdxgPke6V7tOUl/L0TIoib2p2dwvz7Wt14AEJx4ZAsWmKWam1WuSk
	r9PK5wp/hOCabCykg7cDXHEGGZuLSJz4+onsNvV/Gn9eWl7sDdhQO0Ij5ZZ7wbSQXEPWRYEbBZ5
	V17qmSWjR96Ns4Owc6IKolVjHzf5T8JBb8Yi6PlX/cfpzFZldZDS4lyKOavuluKwe82GncFW/Ko
	ewl9p1i77S9x4rk3PeUPhbqGwP+H8boCQofHpj9bxIOy1zRIIMsYcylwlvreZ/r2K1rnOpyMbZX
	SkVP5mKqiUqJXZ60GQeLzlG43RGUVPAs6IcrDzL59TPNJXkLJF7RI9LYgOfR
X-Google-Smtp-Source: AGHT+IEAXQjlvVXuUS+hvcD4d/xsSZzW3BjuYaxD4G0D6IJrYehsEjbaj37l5/daqRdzRScEtV0rfA==
X-Received: by 2002:a05:600c:5110:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4406aba758cmr110202625e9.19.1745310437275;
        Tue, 22 Apr 2025 01:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd35sm163735605e9.22.2025.04.22.01.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:27:16 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Tue, 22 Apr 2025 10:25:43 +0200
Message-Id: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422082545.450453-1-alexghiti@rivosinc.com>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012718_828460_C8F8D955 
X-CRM114-Status: GOOD (  11.23  )
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

Simply fix a typo.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h | 2 +-
 arch/riscv/kernel/vector.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..2a589a58b291 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
 				   RVFDQ_FL_FS_WIDTH_MASK); })
 
-#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
 /*
  * Get the immediate from a J-type instruction.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..901e67adf576 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
 		return true;
 	case RVV_OPCODE_VL:
 	case RVV_OPCODE_VS:
-		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
+		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
 		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
 		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
 			return true;
-- 
2.39.2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

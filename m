Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AB2C71155
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4UHWAej129cf3enJ5zh3S0k5Hdivs2gvJAmbYYFRRpE=; b=xCrB1ddmepGaNg
	NhknZAAZUn8uZYfjXQyrolftxBQQiDnJVB/mk5kzyAgajShpB/+ndUyg5AwSj2WtrJbN6icEngizJ
	PwM6FkiPs49UO+mlPu7/c+7AT8L5NX/gitNyRFhg1CwdeV3s6g2viG7KrWF07WleyMkWOosOkQPxa
	6GgxUrdEyAQ75vweTWWIXmWuM1tql25szAw6mpPapM7L/1CyA/CqEv2V4a2xpXa4ccPX+9fF0u2Em
	Ppma2XvFV2thZKBNTlaqhmmMr4UOEQloHT2Qg0NzPlf92joCFJ1Z+gSZaWqCB94Ivg2LIqmp6gp4l
	rlgfXyt3kEfnkoB/Tb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYtJ-0000000FK50-0caI;
	Fri, 20 Jun 2025 10:22:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXsN-0000000FAWg-1iQk
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:17:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1844140b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750411049; x=1751015849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=Ve3aO1oW0WWHLcj1cWbPc9KY48EKpgq7G298mexjgZ8QiN9cD/DpHqYUJm3n6Bp7NE
         9WynzfmB1D1C+hWvUMbJenzDtF6tBLrrUrb7fKk9i2XlN0w7+UW0QuYhGO+zXcSDwBIe
         LnG7yKQMvrtDqocGpSG95mBnHu0WGLiPu8vSmf2KXtERU1FMBgx4R2zvN910R/jMOd6c
         /4KKSzmZWdIg9ASN7Q+Kn8Y1Ob6HEDK2fVAU2vY4VnzAWpFyPjREqKCClGTr6Om6qauk
         4dtfeJgI1ZCMpaepPq0/QBwN2oTCrsy/bAAvSU5pvEMn47LDZJo0E7nmY5CI+6Xg/duu
         8xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411049; x=1751015849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=qKRn2HjYAE+LUHSRNrvgyvtagT9svvj/6wr4vT0OVCDBCdPePdzTJuBsdoti2HpZgc
         UtqaPUj3KqdLW/EesFpcQg7BEDA5rIATZBEKoTzttjWKS67AsTvPF57oz1CAFb46+mz7
         oCOsoCtTIkwqGhnXnlCk15hkL6AhKy/L2frl3ZQzN0O3eDzetAoYrHSa28iNECPEjeA3
         n/WhWMZsbbqDZrfE/bisTgYejao4VrDYrwaXTa2tH0pxWbM+HUFpmLrnCH5UaNv7CTZc
         DReh9yVq+Q4SUnLvv/P1ET7vIZIs1vq24vzS2ykTfv8xSOKAT/MepoYSxpOYyhEWhIXC
         KS+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1BhnAZfxAe7JQZ6IN08uaWAgLIDzWs056dsKV3aOcIznTYPvvkZ1hXBy7glUAS0hakOLfn83UwZE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyL84aEahB67la3ImUQVhVXxh43fnLaIp1RyRNU5oPTOQEw5iN
	gg/gVoaSSa/eoSrpABOT5/PvU0Ff7II0Yq20sAJHUDk2jIMt+MaiHaovCAit4L0KwR79MrEAgxz
	HBrxkNDO1T5V1
X-Gm-Gg: ASbGncv1IL4hCl6QBfVNa9svMqnToHN5pNAAjaKOj0uUdwbZpEQLbM6Js1OW6XSGc7i
	xOLcMwpGCRPCpg0QToPGv+UxXB/NdmRDAZ8++neP0ZzmYWxCpO1VFsZYl/8QZ/K2dZ1k5v7XGKo
	krSG6VRM0k0PY8L+aYk2z6NUKg4WlHLpuLVYQcxtR7F8sq6Izhbo9v18rbjMcTXoaV2YMq4Di80
	yE7KYI6x1r312jxxeTbXDE6l80fIIuo9Q6fbQZ32VAur55uIS6KqXZhhYVOaJ9EFld01niOTynn
	DgvMeyY24R+93NkpjbkrFN/Sn6EPfRz+4NrCpAn3I+2O4Y+NjeXeVkCgu8KTHiCih0g3KSVwaKe
	zHHBsY+AIwDViNGhf/WXqK6Kce/0+BzN7UCZzvyHn2zeBkSwAbDPHMdE=
X-Google-Smtp-Source: AGHT+IFl+mvsVS8E+myUXJyeRA0NPyQGQ4vLveBBEzuD3+Qemhmjod5mWIqNQeJQuwr4ZVik1pW6cw==
X-Received: by 2002:a05:6a00:2789:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-7490d4f533amr4072727b3a.3.1750411049294;
        Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a4a488esm1643231b3a.63.2025.06.20.02.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 02:17:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Date: Fri, 20 Jun 2025 17:17:20 +0800
Message-Id: <20250620091720.85633-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_021735_438229_8DB5132B 
X-CRM114-Status: UNSURE (   6.29  )
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

Delegate illegal instruction fault to VS mode in default to avoid such
exceptions being trapped to HS and redirected back to VS.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..97cc2c0dba73a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -48,6 +48,7 @@
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
 					 BIT(EXC_LOAD_PAGE_FAULT) | \
+					 BIT(EXC_INST_ILLEGAL)    | \
 					 BIT(EXC_STORE_PAGE_FAULT))
 
 #define KVM_HIDELEG_DEFAULT		(BIT(IRQ_VS_SOFT)  | \
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C3C54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4U0UfAxvfhHLEUuhMdnIVrg+jtW7XF4LRm+9jnvjz9M=; b=WmbQaH43qcMib2
	RVw1Fxj1Gk2bAO8g31vR6LBmb1pnv6cHGRIu++azrbyzeAxBxF0eEPHDu2aK6u5xiwPa9h1Tqw09H
	XikI/PmLoKevP838PLTf0LeH6iegkKTmjIEH8NEZSNVCWI9+uUBBmFDx3/in5CMvamZ1PyVzLOCp5
	lu7zRXLueQU6Nu8ii2gv7D9/8396oPgXG1JhwKu/bP20r7TQ7ot0pEINbQlDPfFM7+LXT6r7QV8Sb
	RnnSVWeovC/2TI2lc8v3ggQV9P8dRXmInx8qyoWJIPKck73/Mx65uuMPIFhxAmDFQ7tLkEgNTzRN4
	cptSu2th654qZx8p9cOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINQe-00000003GFi-41Z2;
	Fri, 23 May 2025 08:06:56 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINF4-00000003EdC-2tGA
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 07:55:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b26f01c638fso6823789a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747986897; x=1748591697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdKIs/OPWingmzjqwsRAF+gbP4NwJYTmT7Tn9PtuJtk=;
        b=s4453l3KryMwUvTrVm6R1wRonJpS1x33xnQfDGi8jFqejalMtoOJXvePlIEaaXQDct
         kizLoRkwmRKjpfNjKefTE8ZLE+M8JRDLZi1X2i75zBMItGAhO228fGG+3vVRUBf6ATGM
         aZDdRuKC7yUdrShBZBFNGpUGriwLmuXqowQ+BkmfSLX7rNqRo9P2R2gTIA/aEN8rAKZs
         zjR+bImNgM+cw23ggalxRhacWFzG9FXmxdivu8FqFYKndOGFBhdTymGjMh9jE5ZzYeXE
         fzYhktvRXkNv8QrHwfvQsHBMgDu4Sbq4ePeOt1hqnmEI+Iy7PrxuV/ofIdJJC6Vlg0zR
         XoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986897; x=1748591697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdKIs/OPWingmzjqwsRAF+gbP4NwJYTmT7Tn9PtuJtk=;
        b=S/gYlmpuIQ2i2nbluZduBamO7JZ1JPvK5xyZAERmlYInWnLOl5Wg5AAtlRMxKr+ptU
         YS10DXnDgQ5a2T97m7xmZshWyMxgpUYPriSY5on9qz9dvzCEp11r9g2EdefuZUm0KCnS
         6Q1O9ZzOhQZELXrJ9Bp/yetxkinaTHguSByKN8Wb5TWLlwjaTiqbvkjXSkSoLi0UeWSL
         CyEF1H0RHf//vgAvZ1VrY+R9aEuXVM/QYbnvtywt7298cDMTSjAkLMqI4u9W2P9hbAe2
         Vg5OWx/0H2QLGWvxBdhgZl3ARp3Uax9D6OJQvGEpSa+fXjI0pkP6/D22Ij3lHgnpHxm1
         0J3w==
X-Forwarded-Encrypted: i=1; AJvYcCVJKSCj3GyLLd3c+//pXuJtbfz9o12SkE7Pe7odTzhcb/JkQMN6kVcvdDR56HML56Qnh3PplM1bazc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEazoCHS7oVvCMH5hU2xYVjY6E+hvgYUY74agBuyu/g7M09SEc
	vn2mfgwH+B6WbE3RENa7309mCW/1tbvfpQBvqG/Por72sCnb0LE7zoMQaNaL0fHg9VoYY6W9haB
	0+mgkEZk=
X-Gm-Gg: ASbGncucKTWFs5yUawton5g+Hot81fLXs96j65AYOYufxGuEL9onDq3mmBS4Y9IczTF
	dPNCH/b+5zrComI07oBcgP/MhDZTLfB6GcaZXJPCevRFicHmmrHOUEuqnlJ7/PZBdUltphGTPIa
	wY+SAKjbIWo3c0xTn30Qzmq3ZbH9mcsrRSphasfZFTLMqa0p+azVRhRCtd1i7JdtEUQYv0KBGD7
	UmkHpUMuhGn5bvGZd5NAMkD6hrm+xFdpiKXbZO8Ktq2xHjNx96Kd7r3ATZfmUZFG+WD/tbRUT23
	Dy17EHfbe0n4Fwt9vT4Qd2h1X7HUlP37fmnfM+e3pAjwIrbSrVt49MKL3Dz+Sew=
X-Google-Smtp-Source: AGHT+IGiy+ea0mbWmBO14R6NBy/k6e1sev9uX2CBS8vsXn8mhFotQ0Eap6uVkvQg93itJl3+Yi805A==
X-Received: by 2002:a17:90b:58e7:b0:310:d980:7a84 with SMTP id 98e67ed59e1d1-310e96e74dfmr3309172a91.19.1747986897230;
        Fri, 23 May 2025 00:54:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36513bb7sm6767204a91.46.2025.05.23.00.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:54:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [PATCH 0/3] riscv: Add double trap testing
Date: Fri, 23 May 2025 09:53:07 +0200
Message-ID: <20250523075341.1355755-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005458_993314_2FD092AB 
X-CRM114-Status: UNSURE (   9.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGEgdGVzdCB0aGF0IHRyaWdnZXJzIGRvdWJsZSB0cmFwIGFuZCB2ZXJpZnkgdGhhdCBpdCdz
IGJlaGF2aW9yCmNvbmZvcm1zIHRvIHRoZSBzcGVjLiBBbHNvIHVzZSBTU0UgdG8gdmVyaWZ5IHRo
YXQgYW4gU1NFIGV2ZW50IGlzCmNvcnJlY3RseSBzZW50IHVwb24gZG91YmxlIHRyYXAuCgpJbiBv
cmRlciB0byBydW4gdGhpcyB0ZXN0LCBvbmUgY2FuIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQg
dXNpbmcgYW4KdXBzdHJlYW0gdmVyc2lvbiBvZiBPcGVuU0JJOgoKJCBxZW11LXN5c3RlbS1yaXNj
djY0IFwKCS1NIHZpcnQgXAoJLWNwdSBtYXggXAoJLW5vZ3JhcGhpYyAtc2VyaWFsIG1vbjpzdGRp
byBcCgktYmlvcyA8b3BlbnNiaT4vZndfZHluYW1pYy5iaW4gXAoJLWtlcm5lbCByaXNjdi9pc2Et
ZGJsdHJwLmZsYXQKCkNsw6ltZW50IEzDqWdlciAoMyk6CiAgbGliL3Jpc2N2OiBleHBvcnQgRldG
VCBmdW5jdGlvbnMKICBsaWIvcmlzY3Y6IGNsZWFyIFNEVCB3aGVuIGVudGVyaW5nIGV4Y2VwdGlv
biBoYW5kbGluZwogIHJpc2N2OiBBZGQgSVNBIGRvdWJsZSB0cmFwIGV4dGVuc2lvbiB0ZXN0aW5n
CgogcmlzY3YvTWFrZWZpbGUgICAgICB8ICAgMSArCiBsaWIvcmlzY3YvYXNtL2Nzci5oIHwgICAx
ICsKIGxpYi9yaXNjdi9hc20vc2JpLmggfCAgIDUgKysKIGxpYi9yaXNjdi9zYmkuYyAgICAgfCAg
MjAgKysrKysKIHJpc2N2L2NzdGFydC5TICAgICAgfCAgIDkgKystCiByaXNjdi9pc2EtZGJsdHJw
LmMgIHwgMTg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBy
aXNjdi9zYmktZndmdC5jICAgIHwgIDQ5ICsrKystLS0tLS0tLQogcmlzY3YvdW5pdHRlc3RzLmNm
ZyB8ICAgNSArKwogOCBmaWxlcyBjaGFuZ2VkLCAyNDAgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3YvaXNhLWRibHRycC5jCgotLSAKMi40OS4w
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

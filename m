Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B3FD5B154
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=01DRSp1qOnBPUOTxROoFA9MDBuvrj7S/luL7HXTlzBI=; b=io0RApBHc4sfav
	K8m91KBDjxVWNZtporLLDIJxi9qFOi824TNttGrJtUZ7N9Ci8ZcSOO+tYAA9qOLUCfpBebgBt19gw
	JIJUda44pE3Wk3gG1vWwH2pHjX+BoDBKbfaNCVNX39ZLEUioYNoVCUgkj4rmc7tydI5tqEJVsYOrr
	5Q1X5x2uWqgR73AITd36YZkiXzYUB0LuKCTb9YrSlYQWnco7l1RkJHLTu2//cdwmIaQQUzeJXtyCs
	MACRqVHXlxxo7hwpWfQWOqhp+uyRYZuX5kILWXeNUkDXqN+9tI3RP3rNw1+lSo92mQAg9X7R5mKK/
	N1F0GHOf9a3QNUb7EL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFB-00000001idz-3OeK;
	Sat, 13 Dec 2025 15:09:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURF6-00000001icz-1i9k
	for kvm-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 15:09:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29efd139227so24624825ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 13 Dec 2025 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765638547; x=1766243347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LpiaxQ88oSu49YC1S31RLxm6uhn7aR359oZeGdfAIAE=;
        b=USxIFOQzV7RlABoXFw7fwmxPHzmWCp5ttHiKHNqc6kBUy4A2cCiX+onyDeLINLIuvF
         rNIkuy5GiCbc2zbz9GdB7srlsl2H43gYaMLSeqKR/rXBvTEziLx9/sJNXnAVKQifm7wp
         zkqbjt3/cJKG9R3LIIXDAlZxl6oa5otPWgTq/3GH93Uz9mv9NJSt7mD6ShHYXFbp4uoc
         57DxmoNePfV34/YBO8d5sFVaucjGei/sIoDWrw6yQP5P0iFrJYfoABaDOcFsSJ/32Ay2
         jYVzNeomY+5Lu4Rk/zuGOvc35Y3mc+LZAs0vmTgTJ0zbXGH/3FFz10TFzz3ZFO0Ajrli
         aL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765638547; x=1766243347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpiaxQ88oSu49YC1S31RLxm6uhn7aR359oZeGdfAIAE=;
        b=sGYWzgi3j+FU2rHxUX5nH+gAEA88tCQnB92M40/8Dsm0OwmUpSN0oSY8YiaCgEMu5f
         xs0x7TZSfqJDaYQjYi2hWWCR7HiN7Hs1lQt1FrwsSq9yCH2RUFiA6DGH7ZLoJzUofUGL
         BIUXZy5jyN0DQ7NV++bnRhGr/4W51VlGmivEfR45p8z7Aq/7mLhyqa90K+GmI0HQROmF
         9fKZWY3cuFsV5RC2NCtaUiWsK1/W71OyGdpIjJbyFACmN1FcK5QH9OT81iMVBXe+jnHW
         8DdnXcC1HKeG26CA+5QxFwk2aj211I/rLtuQN7HY1XSBmJgEv0POJRYU2MildgxlIQD1
         jLpA==
X-Forwarded-Encrypted: i=1; AJvYcCUwf6cXkQmyB/UpG0W9UdHnndC1fZiLso7uJ7oAHcCRxgWhfqW5o9T4HGDmDlZz9G3CrJ4GYcHbfEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGtC53KYD+TJ6N2Z/uxmbE7o1N/q7pde0cdOyh/nHOgS9gDzql
	qQXkujUm9Z/2b8oVmUwUOC2KlKEMG3q39rTUqb6keiFPhMNRBICHSifX
X-Gm-Gg: AY/fxX5oLOxFDb2J5KcXiFFRzoVF3cRreMY1yJ6lYz0JMACKKJesAEc0xQPiRbBjto4
	3gTSS2AvneKl+FyF1y7q+GibRCgWyxeIKiZ1XM2x2v3pzHOb1CA3y54QqXBZ3N9oDrQjf+6fk1E
	yH7/Ckj647Z4AQ8RrA8f1DbgvlGzHRbL2yXuDmXHSfvxwucQfPOBCC13xslBS5t/EyusvHXccHJ
	MqPGcoE2USJXYZWnxit4Uj/JXPRui6rS8wv/iw6HtFhSLCnkIJWUCRiCxaFE2Ml5UTZBi9jmlbe
	OuuPfE8dSJR2veI7kJw9m5tosftQ5D8LiyNP0DhHOG3Hb6JEoe+Z6gX4JXXurzLh2V7a72TlVMm
	kPqTKtW7RmpLx8UlmKermBO7ET9McWSFWelu+4NH7mhOEx6/ZQXa6flh9BTVazpchKNe8HctDMX
	sQEq7tIf5O1pe4JQI5TsUnGrwlGGc=
X-Google-Smtp-Source: AGHT+IG0wSA/k6rR6FYauaioJj0C4bTfp7lKrMBL3Wv+JIXImMjZIDmkmFg1qZ34i3GgGlAAqw6vYw==
X-Received: by 2002:a17:902:db04:b0:2a0:a8c3:5f0c with SMTP id d9443c01a7336-2a0a8c35fc4mr10070005ad.16.1765638547217;
        Sat, 13 Dec 2025 07:09:07 -0800 (PST)
Received: from JRT-PC.. ([111.94.32.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm85494715ad.59.2025.12.13.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 07:09:06 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [kvm-unit-tests PATCH 0/4] riscv: sbi: Add support to test PMU extension
Date: Sat, 13 Dec 2025 23:08:44 +0800
Message-ID: <20251213150848.149729-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_070910_761404_7CEEF1F1 
X-CRM114-Status: UNSURE (   9.78  )
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

This patch series adds support for testing most of the SBI PMU
extension functions. The functions related to shared memory
(FID #7 and #8) are not tested yet.

The first 3 patches add the required support for SBI PMU and some
helper functions, while the last patch adds the actual tests.

James Raphael Tiovalen (4):
  lib: riscv: Add SBI PMU CSRs and enums
  lib: riscv: Add SBI PMU support
  lib: riscv: Add SBI PMU helper functions
  riscv: sbi: Add tests for PMU extension

 riscv/Makefile      |   2 +
 lib/riscv/asm/csr.h |  31 +++
 lib/riscv/asm/pmu.h | 167 ++++++++++++++++
 lib/riscv/asm/sbi.h | 104 ++++++++++
 lib/riscv/pmu.c     | 169 ++++++++++++++++
 lib/riscv/sbi.c     |  73 +++++++
 riscv/sbi-tests.h   |   1 +
 riscv/sbi-pmu.c     | 461 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c         |   2 +
 9 files changed, 1010 insertions(+)
 create mode 100644 lib/riscv/asm/pmu.h
 create mode 100644 lib/riscv/pmu.c
 create mode 100644 riscv/sbi-pmu.c

--
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

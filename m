Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2744C54EDA
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JD+8T3bJCGUjES7i2EeulBesA0r02esvAf4OIzHHJog=; b=h6sOkx8CNSvphj
	BRIjh5c6UHhqEoNW3Ah5IrWK4mw2E2Ca33ErFGgn0lnkZXxqIziwOhs5w2saOcZilVIedAKLoRlT7
	hLdpQT9sfxNOAdAWhz7A6IAUlpreDnx6Rzy2NPHAqO2nIbskqUhYZ7ij6CE51QiQzkbjtc53oTF5+
	22j1egASTRgjJhnviyttLbUbx5JccVVNuMcnX/RJ3WJBiwvAvyeOI2xkL1bE75TlMpYkNGyNC510q
	CZDLsWbKwRJDCRCn5AWhuNtvsl9MhHjzqrjzrIX0KGe/qG8A43I9D5r4KSRJhKQjZJjrstHxTvac8
	HmqA9px7fskwnunCzhfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINQf-00000003GGG-2F6A;
	Fri, 23 May 2025 08:06:57 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINFD-00000003Ef8-2ZqQ
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 07:55:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30ea8e2bbaaso5556069a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747986907; x=1748591707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkz5btPSakbSGWg9/hz+J+zFRiWVxpXranSpFqzg2V4=;
        b=dGNm0ULVRiPzoEHD9yvXd8lfgjlImTy1XFSmxwlW3ZNQIHRLv440qwG5PEmQMxze1D
         OsFkA6HxUZIoU8pJhYisS0s8wUQiMEy07tlwgxQ/OHLMKEDYnbPkLf9zQe3QMnamDFmu
         8nwEqaqMTpHnX7JUzpQTx1By/j09kGeknjkMd3lAH025xNgxKAr7D2TRmtptRPS2wSWC
         2DVhfqSINGajSpkufV7OMjT8stX1Vi3ICCJPSkeyEsCeBYJDOalDu1vR/mcDkG2cVn8G
         Ahwvwp4KWl1IwBVSUevo2j3o29qqSgqKxKW0zspPRSbFrvUM8+OHM7ZfnwIF9rqKTI2W
         X0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986907; x=1748591707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wkz5btPSakbSGWg9/hz+J+zFRiWVxpXranSpFqzg2V4=;
        b=qJFfHyS+J4BAdhdE7uHEsphZHDVjw9wf/5m+9yK7r0D0r983xv/UIafN21JRwQaY1R
         2XoZ/KLckfJ6VCWDrJDgl27e/+qccoROp3LeJbJj4Y0LOCt12CH6Mq+9ukff+JlgSNlS
         JgmwqYSXNDAgNTRukbkrR+r14SHtwHFqr9/glkMCOY3J4Gm8b5IMcLTe62xBNr1hT/g/
         35lueFkQ0vDQeYdwr7rkwD+Y0gH5sgA/yr5F8SGLsMT6xrTvUpZWG0w+WN7U/y0oFKWN
         3HA/oMv/szmW617O2zkm4NURoMoUfeawbl0hyemIEFu/9+g/axqydbtQSSMliCZXhgMG
         HKXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLdaIR9ZSYgvg7/i/iUBZgTvm8w4vflnRNnWQAbpANBSwVvDQFCgnxz2YYLdQos3d/OKt26AqdyRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwezOautkjaDD67Jd+KvCzIIY1P24Xg9Cc66A/0Haac8G1EPUKV
	ss1spF+vF36Gt7atRiCUMcli7K++5Isa2NTqcWRtP7/jVLdm0aLQzUC07PDZkopvBH2Bc+lp4ca
	PWqHwILE=
X-Gm-Gg: ASbGncsQm0dHFiLziUDbWieYoP9Vdrows0scyL+ZLgZRFcX3eZvg5+FFEX6OtxUhAqx
	Zvo7L3ecKQSbISEZydUMe+pOtMD451SROzYiC7K5XuBSu6BYj0/WoKIBKxOsARM4nuAMugQ81mi
	9yVSGY1/TLUyEMFssuC5iYeeaCf+iKEuSUOUK6zO1lbNyuvWtW7neYJQjHHRwonmcuGPUNR0hlj
	vt0mpeAH1ELXYtVkPQt7M/Kpv4hGc3OAHOf31NxyiBOyNqIummtoGOsq/U7v8fiAXvmunkgdhcE
	8WgdY+JUnNq9+p1k3bRF9v7dokoXQF4FTdnTqSOQc+ymqALFrzuHwxTZSTf/pqo=
X-Google-Smtp-Source: AGHT+IEPFnlMv+SphSbT2qlgzvzr5e4D7932gMeT71Z7fVhumTSN0YsgZG5uZjC/arGCx/5gT/nsCQ==
X-Received: by 2002:a17:90b:1ccc:b0:30e:823f:ef3a with SMTP id 98e67ed59e1d1-30e823ff012mr42546168a91.30.1747986906641;
        Fri, 23 May 2025 00:55:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36513bb7sm6767204a91.46.2025.05.23.00.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:55:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [PATCH 2/3] lib/riscv: clear SDT when entering exception handling
Date: Fri, 23 May 2025 09:53:09 +0200
Message-ID: <20250523075341.1355755-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523075341.1355755-1-cleger@rivosinc.com>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005507_659935_A4F1FAAA 
X-CRM114-Status: UNSURE (   7.61  )
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

SW4gb3JkZXIgdG8gYXZvaWQgdGFraW5nIGRvdWJsZSB0cmFwIG9uY2Ugd2UgaGF2ZSBlbnRlcmVk
IGEgdHJhcCBhbmQKc2F2ZWQgZXZlcnl0aGluZywgY2xlYXIgU0RUIGF0IHRoZSBlbmQgb2YgZW50
cnkuIFRoaXMgaXMgbm90IGV4YWN0bHkKcmVxdWlyZWQgd2hlbiBkb3VibGUgdHJhcCBpcyBkaXNh
YmxlZCAocHJvYmFibHkgbW9zdCBvZiB0aGUgdGltZSksIGJ1dAp0aGF0J3Mgbm90IGhhcm1mdWwu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0t
LQogcmlzY3YvY3N0YXJ0LlMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yaXNjdi9jc3RhcnQuUyBiL3Jp
c2N2L2NzdGFydC5TCmluZGV4IDU3NWY5MjliLi5hODZmOTdmMCAxMDA2NDQKLS0tIGEvcmlzY3Yv
Y3N0YXJ0LlMKKysrIGIvcmlzY3YvY3N0YXJ0LlMKQEAgLTIxMiwxNCArMjEyLDE1IEBAIHNlY29u
ZGFyeV9lbnRyeToKIAlSRUdfUwl0NiwgUFRfVDYoYTApCQkJLy8geDMxCiAJY3NycglhMSwgQ1NS
X1NFUEMKIAlSRUdfUwlhMSwgUFRfRVBDKGEwKQotCWNzcnIJYTEsIENTUl9TU1RBVFVTCi0JUkVH
X1MJYTEsIFBUX1NUQVRVUyhhMCkKIAljc3JyCWExLCBDU1JfU1RWQUwKIAlSRUdfUwlhMSwgUFRf
QkFEQUREUihhMCkKIAljc3JyCWExLCBDU1JfU0NBVVNFCiAJUkVHX1MJYTEsIFBUX0NBVVNFKGEw
KQogCVJFR19MCWExLCBQVF9PUklHX0EwKGEwKQogCVJFR19TCWExLCBQVF9BMChhMCkKKwlsaSB0
MCwgCVNSX1NEVAorCWNzcnJjIAlhMSwgQ1NSX1NTVEFUVVMsIHQwCisJUkVHX1MJYTEsIFBUX1NU
QVRVUyhhMCkKIC5lbmRtCiAKIC8qCkBAIC0yMjcsNiArMjI4LDggQEAgc2Vjb25kYXJ5X2VudHJ5
OgogICogQWxzbyByZXN0b3JlcyBhMC4KICAqLwogLm1hY3JvIHJlc3RvcmVfY29udGV4dAorCVJF
R19MCWExLCBQVF9TVEFUVVMoYTApCisJY3NydwlDU1JfU1NUQVRVUywgYTEKIAlSRUdfTAlyYSwg
UFRfUkEoYTApCQkJLy8geDEKIAlSRUdfTAlzcCwgUFRfU1AoYTApCQkJLy8geDIKIAlSRUdfTAln
cCwgUFRfR1AoYTApCQkJLy8geDMKQEAgLTI2MCw4ICsyNjMsNiBAQCBzZWNvbmRhcnlfZW50cnk6
CiAJUkVHX0wJdDYsIFBUX1Q2KGEwKQkJCS8vIHgzMQogCVJFR19MCWExLCBQVF9FUEMoYTApCiAJ
Y3NydwlDU1JfU0VQQywgYTEKLQlSRUdfTAlhMSwgUFRfU1RBVFVTKGEwKQotCWNzcncJQ1NSX1NT
VEFUVVMsIGExCiAJUkVHX0wJYTEsIFBUX0JBREFERFIoYTApCiAJY3NydwlDU1JfU1RWQUwsIGEx
CiAJUkVHX0wJYTEsIFBUX0NBVVNFKGEwKQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

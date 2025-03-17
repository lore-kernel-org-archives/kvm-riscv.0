Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A474C36000
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j836qm/fERAgJhzMTxxE2neYlYGKDfYRWUk8hqCcg8M=; b=Rj/uWq52V1qKso
	2V8eHup9qcqhZxE1YZmRdSXzPGP/BwBk50zdRAyzZcpdPGO2UXHQUfch2VxEGgLMN9KOHBkB5pIP1
	cGmJ32UpBXaXSGGaN+gpJYMTtQ3fpE7UsX3jZnKHHCyu6f5Yz8z7Kwgv1P1UYZEbLx1rRlxDu1cvF
	fqmtgcxeeuYJx0gSFdRQy7Psz6MMlsydNxE2rztt5PYeHXqtuBmXLhpxfEJ2lhn01VqqsDqcu0UZq
	wZy/cdOi8vm5zSCnDqVGmJalv4DCL4BixYF1tiRA5lw4B4EpuDuqE5zYgFVS6Q92KxaLdbZpjBw5X
	QtPQfcUfc8dkxTAYTIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1R-00000003UzZ-3tHv;
	Mon, 17 Mar 2025 17:13:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwm-00000003TRg-09sg
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso23756965e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231295; x=1742836095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=v/zRCOPmgZ5fjeXN5kkWNwlsgOVBp6z5MRFvR/4fB3IvoSOUDLlv7HY72lvJHAVB7y
         3ltQH8FCpEW/zZR9eh4BPcbS2TAyzARhle6ChVs1DThQQRgEFt4yxT34WAZJoeh+ddrV
         f/bV0SOaxnmSGbT7Pzb8cOX5UC21TI0VVtjNmia5CronyzRvRP8gBljxpQX/zmL7DBrT
         EgjfGuJyg/blJKz4lOZvDNTZQ+asJSykU36B4jKAmdkqbgaYMnl1GJVcie+xmR7WLR8K
         z1AV1EItKNDT0Xue2bPkDYxv882aaLqbrTGk8pSKL6jL1VfIiat3iH48itOzJ1NDjCIk
         sqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231295; x=1742836095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=O7DvQ/OqGjGNzYBsM0te40LmkPP8spImwLil+9hCmiJJNEBB0BEG3Ixst6Q9tQdMDC
         tNALzdrMg11/d3ij8U5ltEeeKWd8wHAhNJyInglytxR5U5KIl6r4/pqFVq47ABPESlgo
         HFsvwoQrCNhUefWFdBT1jBxm2sLZ5LXq1oXISXlQ1cxsOY2Q3Z75Oh76bMkBY+vmM5WX
         Tgp6XlYx+CFaR1UAgXgt8EnfiTBMJ6Lzn2YMQ9QaaEoTMXsKA5iKCU3Wbkh93dpluoqy
         ikk9KEpQdnVAfPogeb7oKW/A5b3uSogNFtjERi6ygH5R+ZK8qg6Wi63V+MfAwjQ+Wf7i
         vjlg==
X-Forwarded-Encrypted: i=1; AJvYcCVz57t6xbkxQuXflmgIS98yYmu2waA6b3FYak83+0OLJqdVFQNjmTxRbwb8fDD5ghvBjRupxZ9aLrg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcHqlSO8lwgaDCxou5buF42dzt35lXUjdyQA+pmgB+WABH1uJn
	EZawo3HA4h/ekmvJCjpMJGsDUnIbKPc5Dj7OpHoTw6Ej2272N2lBXecmSlydG1c=
X-Gm-Gg: ASbGnct9iEPOHYROOGJp8IhGoLIG3Hxogb5lxrCoVbxTxsd52XApCG5grYTND0pW5Vn
	gEdVmT2yCFoqzxshxvF32ftUX3JQKnfd9t7d6e/3CqTi+HgJTk8PNDfN5eWDXeoogXuFHPCKTlt
	0CYeX0N8l+VOfNtBaKkFJSPEdCjHnU5ljFjSvW+qVDHjmjC9aGUQIt28WxmVegO0absz45PJJhs
	6tOeWJA067n1GLcw+lJIABaWSjJ68PJCMVIY+4WSDPJxcIIjxL4txT7dBJlegJ1dgNb3AG/YFRJ
	9z4fK0Qkl/AcKL6jY6wgj4VvTXuEzAJf63GyEFDFrQymew==
X-Google-Smtp-Source: AGHT+IH4sjX9gto0lgEtyEEfUnQHUD379+GVWmuhA4p7t8yk18Gi55URplLVQo2Ek/+dIEHXcxDHKA==
X-Received: by 2002:a05:600c:314b:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d1ecd894fmr147448025e9.30.1742231294732;
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 07/18] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 17 Mar 2025 18:06:13 +0100
Message-ID: <20250317170625.1142870-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100816_092987_78437DBA 
X-CRM114-Status: UNSURE (   9.83  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggNDU4NGYyZTFkMzlkLi44MTc1YjM0NDliNzMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2Miw3ICszNjIsNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==

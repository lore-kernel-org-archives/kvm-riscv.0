Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7EFC021A4
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucp4gjnc59NmFzdQm7+UAtDZy6jzTNuMkqljtyAJjSM=; b=mq3rEaG8b/Or3U
	J++3LnSsZODolnZ0bfWTtRud1+fgrKi0ZytYGL2v5X2yBE/zXNzfBgxqaAu8rvcCODwuiTaRW2zYk
	f6WYpDWJ165+j37yLPIEY6YW0ZmkUq/KiVXYnhjDHi5qO6R9th/xr5muUWn4XL5/DRfWe2aor2qdn
	T2AeLHM5DHGoTTLnz47xa07zQsgm8FMO2v01pxAigsoBQdvkIcTn6ULgmk98Jb0mKr1sbMG610MZL
	Ew5LFjnb740vUttsfNNt7qjgWh5qqYZy7acf4eSSzndb4X0I56ZuWz6INZCqG5t1tLQFMLSH/ok2r
	UM8hTXEdTmYmAGKfLjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuEg-0000000EkaW-3vKW;
	Fri, 14 Feb 2025 11:51:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu7u-0000000EiyF-2T8y
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:44:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f441791e40so2834255a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739533498; x=1740138298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCReb3cvg707HPbBwZSbIVzyvT4c2UyWOl9p1yzcaUg=;
        b=hzwhBRYsXmUekOwu996oceOsFEJjc23DadNMwZp6AG6rg1A5I4ubQ/u14oWarpluH1
         Py+EKyxmWGH9BT5QgDpaXgmIOD/49Gqtu9y85qpiHidAoHuw6zP+/ZDY8V6bG8otz/kT
         X6PMSqxBjMjW7rm9r9jgVBT3irYMB0mTAOb4MLtac6tgnhIctRp5CrNbfLgm3XyoB21H
         807Skmv5vPFkMZ58r/kE+Exb7relopKOj+BP4/H40qxpJ3l7nyJpUHc9068f4BaITcoY
         hpLgRUStiOc6eyxVECOTZj3gONfUJDgDvB/d91KtjyxC+SyUVoBrQwAbnBTVoTM+lmKB
         5Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533498; x=1740138298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCReb3cvg707HPbBwZSbIVzyvT4c2UyWOl9p1yzcaUg=;
        b=GkCdeEIQ/Q0fzDj42/sTwDcZhWO2YYOexzJO0R9iNkj2dDIcl2GEytnYjjHJvKN9r/
         SnHNTkmVH5gumBJFuRrrGftn0b9SlSL1OKiYWqxRxrB/iLbZKx0Z6mf6SLwEXTf5m2hS
         HKwlaK+JXgwjokfI9sjTfvT31v6CNj2f92MyytPhl9iu9wpwQFZkro0Aaz7WpeYrxvZl
         QbQSApV8BmT+tQXu5F2n3f5+Qc4O3w8dzWb2HNEW8U1VNw37aXkRk9LPIf4OeZdK0Tg/
         9OY87VN6tlermkL4efhtbj06Tc2E9c86lVFjicCmfIInjd3ryYjVcEXFI13uqJ9WUazW
         lr2A==
X-Forwarded-Encrypted: i=1; AJvYcCWONg+i4B1T7XXuFMzoPmcsjP+dCVmwUf+fBt4wRMAU8EblDnqCReTJr4KE1xhzcxS8cTOSgvblAjU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8WU5xBZRIsK/szJBWJfE849DItyXPG07u0yHb8lNuL5GE96gJ
	We4I2T1Ltellk83Ru46OPl5tQJn7xdaITNxe2d5c1LkEzwt3XFLZaj6Yd0vX3pA=
X-Gm-Gg: ASbGncvYj9QSktdbrKVQl/8Tee+mZJwx6+Y11/FyZ/WDVsZ0RLCdvo0UqCYK2NoSbdv
	cZMOzbowvsPCB8NStQsH5Xu9jCpC4cOGfh0vBy2hc1TDtLx3QjSWiDj6digkpNVcGClVZAcpVKh
	V4YTFwoXVvB7jnkNDQ9Z0EeN7h36SFgz4qzl8Urzx44rz1kY5n/jemulzgs+SZaL3tvBWkCOj6t
	033Y5ylWCNA3v0KpbmloF83r9ctVDBMBq4C3XoUeNEPlY/fpbiG94QFDGroA0gU3G7tYAbWynq1
	htglWEFWYOdFR480
X-Google-Smtp-Source: AGHT+IEFLobxG/BCLHywnrzNtfVd4bGo5LbKUHk1gDEPSL7O/HmCPgInYxOwh1OyU+I+GVVMEI2OQQ==
X-Received: by 2002:a17:90b:2742:b0:2ee:693e:ed7c with SMTP id 98e67ed59e1d1-2fbf5c6b76amr19554909a91.33.1739533497797;
        Fri, 14 Feb 2025 03:44:57 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f6965sm4948862a91.29.2025.02.14.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:44:57 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v7 2/6] riscv: Set .aux.o files as .PRECIOUS
Date: Fri, 14 Feb 2025 12:44:15 +0100
Message-ID: <20250214114423.1071621-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250214114423.1071621-1-cleger@rivosinc.com>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_034458_624967_C7E6607A 
X-CRM114-Status: UNSURE (   8.07  )
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

V2hlbiBjb21waWxpbmcsIHdlIG5lZWQgdG8ga2VlcCAuYXV4Lm8gZmlsZSBvciB0aGV5IHdpbGwg
YmUgcmVtb3ZlZAphZnRlciB0aGUgY29tcGlsYXRpb24gd2hpY2ggbGVhZHMgdG8gZGVwZW5kZW50
IGZpbGVzIHRvIGJlIHJlY29tcGlsZWQuClNldCB0aGVzZSBmaWxlcyBhcyAuUFJFQ0lPVVMgdG8g
a2VlcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgotLS0KIHJpc2N2L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxlCmlu
ZGV4IDUyNzE4ZjNmLi5hZTljZjAyYSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysrIGIv
cmlzY3YvTWFrZWZpbGUKQEAgLTkwLDYgKzkwLDcgQEAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9s
aWIgLUkgJChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgogYXNt
LW9mZnNldHMgPSBsaWIvcmlzY3YvYXNtLW9mZnNldHMuaAogaW5jbHVkZSAkKFNSQ0RJUikvc2Ny
aXB0cy9hc20tb2Zmc2V0cy5tYWsKIAorLlBSRUNJT1VTOiAlLmF1eC5vCiAlLmF1eC5vOiAkKFNS
Q0RJUikvbGliL2F1eGluZm8uYwogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1E
UFJPR05BTUU9XCIkKG5vdGRpciAkKEA6LmF1eC5vPS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChB
VVhGTEFHUykKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==

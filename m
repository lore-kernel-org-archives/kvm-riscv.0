Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AC1E77188
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSBRL0VqlYDJBkpb93kbdpoF+74ayB+CJZlDV9Xo+MQ=; b=PxWGWy8frOT8rI
	Bss00J4f+ZTUb/Kos7gwReQIWZ2UuBhaBE3NGbxCpd5kD/uFOZsm03o95FVZEiwlwtCj+DtTr4STE
	BIRourEKtY3rnV+Smz8wOCATvZ17/6lvPp2zOcr6cPCwyCakWSGCWwNhVAwNM2ZKfqnScVf0PtcPg
	Q5wN9ImEExdshHZC0Ve+VZW5tnNV3wVDkCzX7pFBdTsdr5Qm0uXQq24wzUX/QXBPaU5CEMMtj6zgz
	puXvncJz9MiUiaIuOpKvIxf1TIwgzb/iNSAjaXQPFR8iiS5T1k1/ImGxgjbQ8Ijis8fpB0jkUE8Wg
	WL23oIOElNUXE2GHlePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmM-0000000EbmA-0Txj;
	Fri, 10 Jan 2025 08:54:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmK-0000000EbkI-0ark
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:54:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4362f61757fso17958715e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736499242; x=1737104042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo2c3Kmn1NpBbL7JEgarZYwtdAct+NbwdDVbie/BNhQ=;
        b=y6QB+njAucHZXcVH8ZLoCaOnnb0lleMEJxeBmAA7oO8+3w3D+Ac0T0AQ9wbpWnO71b
         mPJWuTv9Fbe1Lj1ZLsQ4mxMBxHmdV2363O2GICOk//uKS9a2hzPsxyXwqlY4bkVKyIIx
         X9qHGMNu/zQtcUTe1SQTP5xRPV3EmZavXcBhgTGjuhdqSa3y1QmwYgNu7gbsZMb6dOA1
         k1icuCr4T9do8i/ROELcuAClA4YlBeXsIPc6w6D47ZImL0ILMjVR2qqy4sv+FIdY+5po
         o3aR3MYnUXvppDCsSGcyVQvhlmohJN+k0CvykyOX7WK+wxkDnbslST19MJ1X4AUCHQmO
         mdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499242; x=1737104042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo2c3Kmn1NpBbL7JEgarZYwtdAct+NbwdDVbie/BNhQ=;
        b=mQZDv/0HYk6uK5mhEgnXvrF+yurS3vMu++r+skI7B9Ega6PIRFhT7nGYKK40bnWhPZ
         h6j4zUDuhEyKCRjoWBxSrX7uc0eJwFdbCL8H+yocjnzVYyWgAiCp8j1oaNvuEc3l0xvn
         hLZo9XbsgC2F4ZeNjTycVlu/DMrJtFTF5f+dcm7wxd5iodU6TKTRHDFcYxDnqEXFKnVS
         4KRQvq2+Ob6HR4/ooI1Te0ecRvwXzsutqmZwdpXo6rqzNMqq5tSrSaWLn/V+pUd8WjLT
         Ynpl+F3mJ1y9ODLWXh/9+lu5W+R93ux5J9pbs/kS06+Cvl+RTVt6NcBXXFQICYW9DUZJ
         CaYg==
X-Forwarded-Encrypted: i=1; AJvYcCUb3/ga7AzKP4Y5Mf7U9ERw2V2Dq7hzlUiLvuqzp0IRybKWq7hthMi8ZwFu7baHAGzf2Kdns1YoTWU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeTKxeI/OfIGMBbvSPe0/WOC8cXaCvK9Ym0+ua24XXpNA4nQly
	kf45b0khjl41dmyw9pktlFLLMxWMUJkP1c4ltYP1wE89FN8LS8ovce3jof7j0Sk=
X-Gm-Gg: ASbGncvJrZofka+w5k55Tb/b100e7sP9AhThVa1Oj2yN3EjkjDX57gHBcYX9MZC6Hhs
	TK3Bl4/CHRF8NoH1Dxyu53wgWdpHhKltORNuwCdxGUkgWrHPeKsPlMRqnzdSjBhoqRZO1U+ar5E
	sHiJhkVjOuOvKr0K8hZygtZv+WPcMCTV0/DYlbfN+Hv1ob/E9tTMX3OIMX9I2hoEZj/IDmvVQTg
	/qmIHi/dn2t2tCuZz6Idh0k0HvXx5ENwI0a0qipOp8NQsQHojLY9H/X8Q==
X-Google-Smtp-Source: AGHT+IELiLUe9pIM01/duXyEhp8KpplnlsSsnZH1U69fLHxCZ1KJhYpExjgHw6icQ4CFPxg8upfmOA==
X-Received: by 2002:a05:600c:a07:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-436e27082e1mr86774845e9.20.1736499242527;
        Fri, 10 Jan 2025 00:54:02 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm4009283f8f.94.2025.01.10.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:54:01 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v5 3/5] riscv: Add "-deps" handling for tests
Date: Fri, 10 Jan 2025 09:51:16 +0100
Message-ID: <20250110085120.2643853-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110085120.2643853-1-cleger@rivosinc.com>
References: <20250110085120.2643853-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_005404_180626_613DD969 
X-CRM114-Status: GOOD (  10.07  )
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

U29tZSB0ZXN0cyB1c2VzIGFkZGl0aW9uYWwgZmlsZXMgdGhhdCBuZWVkcyB0byBiZSBsaW5rZWQg
aW4gdGhlIGZpbmFsCmJpbmFyeS4gVGhpcyBpcyB0aGUgY2FzZSBmb3IgYXNtLXNiaS5TIHdoaWNo
IGlzIG9ubHkgdXNlZCBieSB0aGUgc2JpCnRlc3QuIEFkZCBhICItZGVwcyIgcGVyIHRlc3QgdmFy
aWFibGUgdGhhdCBhbGxvd3MgdG8gZGVzaWduYXRlCmFkZGl0aW9uYWwgLm8gZmlsZXMuCgpSZXZp
ZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2PgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogcmlzY3YvTWFr
ZWZpbGUgfCA4ICsrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Jpc2N2L01ha2VmaWxlIGIvcmlzY3YvTWFrZWZpbGUK
aW5kZXggYWY1ZWU0OTUuLjQwYmExMTk4IDEwMDY0NAotLS0gYS9yaXNjdi9NYWtlZmlsZQorKysg
Yi9yaXNjdi9NYWtlZmlsZQpAQCAtMTcsNiArMTcsOCBAQCB0ZXN0cyArPSAkKFRFU1RfRElSKS9z
aWV2ZS4kKGV4ZSkKIAogYWxsOiAkKHRlc3RzKQogCiskKFRFU1RfRElSKS9zYmktZGVwcyA9ICQo
VEVTVF9ESVIpL3NiaS1hc20ubworCiAjIFdoZW4gYnVpbHQgZm9yIEVGSSBzaWV2ZSBuZWVkcyBl
eHRyYSBtZW1vcnksIHJ1biB3aXRoIGUuZy4gJy1tIDI1Nicgb24gUUVNVQogJChURVNUX0RJUikv
c2lldmUuJChleGUpOiBBVVhGTEFHUyA9IDB4MQogCkBAIC00NCw3ICs0Niw2IEBAIGNmbGF0b2Jq
cyArPSBsaWIvcmlzY3YvdGltZXIubwogaWZlcSAoJChBUkNIKSxyaXNjdjMyKQogY2ZsYXRvYmpz
ICs9IGxpYi9sZGl2MzIubwogZW5kaWYKLWNmbGF0b2JqcyArPSByaXNjdi9zYmktYXNtLm8KIAog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCkBAIC05Myw2ICs5NCw3
IEBAIGluY2x1ZGUgJChTUkNESVIpL3NjcmlwdHMvYXNtLW9mZnNldHMubWFrCiAJJChDQykgJChD
RkxBR1MpIC1jIC1vICRAICQ8IFwKIAkJLURQUk9HTkFNRT1cIiQobm90ZGlyICQoQDouYXV4Lm89
LiQoZXhlKSkpXCIgLURBVVhGTEFHUz0kKEFVWEZMQUdTKQogCisuU0VDT05ERVhQQU5TSU9OOgog
aWZlcSAoJChDT05GSUdfRUZJKSx5KQogIyBhdm9pZCBqdW1wIHRhYmxlcyBiZWZvcmUgYWxsIHJl
bG9jYXRpb25zIGhhdmUgYmVlbiBwcm9jZXNzZWQKIHJpc2N2L2VmaS9yZWxvY19yaXNjdjY0Lm86
IENGTEFHUyArPSAtZm5vLWp1bXAtdGFibGVzCkBAIC0xMDMsNyArMTA1LDcgQEAgY2ZsYXRvYmpz
ICs9IGxpYi9lZmkubwogLlBSRUNJT1VTOiAlLnNvCiAKICUuc286IEVGSV9MREZMQUdTICs9IC1k
ZWZzeW09RUZJX1NVQlNZU1RFTT0weGEgLS1uby11bmRlZmluZWQKLSUuc286ICUubyAkKEZMQVRM
SUJTKSAkKFNSQ0RJUikvcmlzY3YvZWZpL2VsZl9yaXNjdjY0X2VmaS5sZHMgJChjc3RhcnQubykg
JS5hdXgubworJS5zbzogJS5vICQoRkxBVExJQlMpICQoU1JDRElSKS9yaXNjdi9lZmkvZWxmX3Jp
c2N2NjRfZWZpLmxkcyAkKGNzdGFydC5vKSAlLmF1eC5vICQkKCQkKi1kZXBzKQogCSQoTEQpICQo
RUZJX0xERkxBR1MpIC1vICRAIC1UICQoU1JDRElSKS9yaXNjdi9lZmkvZWxmX3Jpc2N2NjRfZWZp
LmxkcyBcCiAJCSQoZmlsdGVyICUubywgJF4pICQoRkxBVExJQlMpICQoRUZJX0xJQlMpCiAKQEAg
LTExOSw3ICsxMjEsNyBAQCBjZmxhdG9ianMgKz0gbGliL2VmaS5vCiAJCS1PIGJpbmFyeSAkXiAk
QAogZWxzZQogJS5lbGY6IExERkxBR1MgKz0gLXBpZSAtbiAteiBub3RleHQKLSUuZWxmOiAlLm8g
JChGTEFUTElCUykgJChTUkNESVIpL3Jpc2N2L2ZsYXQubGRzICQoY3N0YXJ0Lm8pICUuYXV4Lm8K
KyUuZWxmOiAlLm8gJChGTEFUTElCUykgJChTUkNESVIpL3Jpc2N2L2ZsYXQubGRzICQoY3N0YXJ0
Lm8pICUuYXV4Lm8gJCQoJCQqLWRlcHMpCiAJJChMRCkgJChMREZMQUdTKSAtbyAkQCAtVCAkKFNS
Q0RJUikvcmlzY3YvZmxhdC5sZHMgXAogCQkkKGZpbHRlciAlLm8sICReKSAkKEZMQVRMSUJTKQog
CUBjaG1vZCBhLXggJEAKLS0gCjIuNDcuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

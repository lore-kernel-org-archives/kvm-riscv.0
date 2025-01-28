Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F223C0218A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjOTdjT2jLvpYqXc5EXtYhSgpl+yjR2u1DLhzuDcT0=; b=gwS/Nre/LGFyHI
	dI6TVxpILtFlxWnircF0pbdhwJlFD83HfxjJR4rtMKY8md1B6avO1y9Kluucudrw3f3r7K0vSm3ZE
	4B4Iy63wrFf3yHyjHVCcdRqB2pIObiJGZpN11KsrNtSi2IGefR5esgo64NEmPHUJ1UY/j/Hn5buOh
	UHlnTDw4jLhFm7oz8Ge6IUmGA4K1n9nkp5MyDtMIGQHjfMXSnZt7i+73u27T6+7M4dlissxaKj7TX
	mA1wxqLrn29OKKmRnUruYYcX7HznjT8hiDzEUS/btwrKb3zTtngBVdOl4JqP/mvymzoLQO13BWrrg
	yHARODklzMniyyb7usAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmPa-00000005232-0rf8;
	Tue, 28 Jan 2025 14:17:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmO9-000000051lk-2TDf
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 14:16:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso60540875e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jan 2025 06:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738073784; x=1738678584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=MaHSYM2CS+rCAtCI6DwaG/kaWMmC0goC9xq5T0QHPgdrrWIy2Ck6FSR32Mp4tYWbeL
         b2cqngZAFmVxqxtq/Pbx9nEEK1D9ujfzlun00vrfqaogqiQ4IedsxntUM5T5bijHd1iZ
         ZwmP4mRuv/8GdJCyr1A4Y00/UjsCXaLTY8RgE/33KSqQ/cf8mg5BN6IXgnTrBhqV7dPv
         F6JRQlUAFL5NbHn0uLhGcFVTG9OeVDJsJcMjnAGGpJxGes4sQhZ01CkQpdVjsrBOrsNC
         U0RlfTZgXfi+K4VdVY1VKZi+//bIZ/+2/NjMGct3zSLoYbPbi/gosAfZGwXgCJaDXazi
         t+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073784; x=1738678584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=wkNHf7cuYHNEc01uyR6vKTjgXarECDp+H2B19pz4YXbSBSZDL/119dRN8Al/0wvcqf
         n1Ih7N1cH+a6qnFY9NMRfhWR13T22GOerXXFUH2J2euYbiPpSTOAdzF/S7J3GsaT4PiA
         JlmBYDA5QF85M3PnLo1n+pFm6wyA7byswamOAXHC/hMKWTkw5K5dMF1zHKnI69Pgi4r2
         BLj1DJWYhGvmESEzGwjKQ8FLRTDvQh1IgVIY9ON66oaRrnEWcPiN9oZ8ulBmLGSjKavv
         ZZEynJWaPJ3MUsgBcfIKk0rNKMA3m2fu6jtaFbniqWzMrgqbf0gOUDrajx2N5ine140c
         Z1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXC8QCW1PW7z938GoSNEL+NvssFEyco+LpHaznjjjQtmJH+0kR9Ay/U02ga/1KmkmQonZqt1PtZLaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTy6QEDsOqvkuvylsGg9tiyhB/xFxkjwr3jYutIZYLxi1abo9Q
	lTSyGYXBkBi9qBL6rEcuv4yevGjkWDdIyqcHhtu8VaKatXG5VW8d/YclLkI4ELU=
X-Gm-Gg: ASbGncv0WPH4VKI1NOl/zz6vsACfIpJtF7z2BajhLg9Hdv4Xkksmvm3VtT1nJVve+PN
	tnV8lmp4QKIvmBygJDxZRsZh1iAgxxrIHGuNnsiRO4jrAJt2McOvR0MDH3lt2eMWgNdy3R871rw
	H7zyVzeexP/nD0+sc94JNBXITey+tCo+i0+c6Rd8eDcRIiidZ/i4uJwaiPQUWrXa6xaLf6hSmZ6
	RmxXBA7HEZUHdSyUkw9heTt+p6UUmw89bkZ/AZytGW35mkE/pdh+8IG+cXjB0jpLMBgP3ashyHp
	fr/MjsIDGbj4iCwf
X-Google-Smtp-Source: AGHT+IExkAsT35CibNqnfvFyENC5hhiY7L+ALKdkPXj3RJlFXYg67HOTL5u/M3wiW36Bk+dA5lPp/g==
X-Received: by 2002:a5d:5989:0:b0:385:f6de:6266 with SMTP id ffacd0b85a97d-38bf566f72cmr41616295f8f.24.1738073784041;
        Tue, 28 Jan 2025 06:16:24 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c402esm14435772f8f.97.2025.01.28.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:16:23 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v3 1/2] riscv: Add "-deps" handling for tests
Date: Tue, 28 Jan 2025 15:15:41 +0100
Message-ID: <20250128141543.1338677-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250128141543.1338677-1-cleger@rivosinc.com>
References: <20250128141543.1338677-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_061625_627874_995460F3 
X-CRM114-Status: UNSURE (   9.91  )
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

U29tZSB0ZXN0cyB1c2VzIGFkZGl0aW9uYWwgZmlsZXMgdGhhdCBuZWVkcyB0byBiZSBsaW5rZWQg
aW4gdGhlIGZpbmFsCmJpbmFyeS4gVGhpcyBpcyB0aGUgY2FzZSBmb3IgYXNtLXNiaS5TIHdoaWNo
IGlzIG9ubHkgdXNlZCBieSB0aGUgc2JpCnRlc3QuIEFkZCBhICItZGVwcyIgcGVyIHRlc3QgdmFy
aWFibGUgdGhhdCBhbGxvd3MgdG8gZGVzaWduYXRlCmFkZGl0aW9uYWwgLm8gZmlsZXMuCgpSZXZp
ZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2PgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogcmlzY3YvTWFr
ZWZpbGUgfCA4ICsrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Jpc2N2L01ha2VmaWxlIGIvcmlzY3YvTWFrZWZpbGUK
aW5kZXggMjhiMDQxNTYuLjViNWUxNTdjIDEwMDY0NAotLS0gYS9yaXNjdi9NYWtlZmlsZQorKysg
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

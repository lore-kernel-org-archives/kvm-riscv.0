Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4371CC0218C
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjOTdjT2jLvpYqXc5EXtYhSgpl+yjR2u1DLhzuDcT0=; b=Mm/oCU5JiDHBMX
	ZbQrVwZYluO0ht3w1oJLC2JdnZ71ywixKZAeqvl+75wz9eKZnjlWEWYUCHhBEcnaNTN0GTeAtURim
	8dQ6HXqGEYQKETqK1NrLeFaqpLl6xu6tJZWM8KqdRM+40HrVDYyrTLOwNmVQq9160k4X5bDZcNrNA
	ZV/gaaZKoW9pbBtmNy/I0ZuNonLhfTNJ53HGq2CCk/EzZb6wYGkBeoE0iBr6+He8hJQslRRdtY9W7
	gZMhjPR4SxkvHV18NRsqqqlpMj8xhT8DrGRlcjIhITp/vQ7qVwLmGZArlrqL9WZm0QmeX2u97FIyV
	ZKY17Bd7YqCQyoI4vEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0TB-0000000Cra9-04lz;
	Thu, 23 Jan 2025 16:54:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0T9-0000000CrZJ-0QRi
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 16:54:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-438a39e659cso7787195e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737651253; x=1738256053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=XR8p+oNX/3LI3BJc8g9uyoI1FhzGQIS83gyFn27K2Mpfwrm3Idql0Xi0oSiLr7h2KV
         V9j1hxlMIJV9qs7VwqofSkHIgyIbeX3CRr0Mr7RP0Ru16oqNQMtXpiN280xruSjlcJ4n
         KoDKwMkOikIdV7x6Uo8LYILxrNh0K2RJmf5GH94bIRCrQcWJ12wY13fpQNfrmrMsX6Lj
         5Nnwi6DV5ZgO5dJqIaNuWvkven8+nBiKsMyMrj7wwl4Jw7QRNuxJk19d3d6x4uxThmJe
         Ya/mEt5rG1pRZe8MgfQ+hHuLmImrD+eEfGy0RpXBTAJKg3cI+hNq+wsz0P8iyFTrtkQJ
         h7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737651253; x=1738256053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=iejFASp/JOgEq9LDpW5g3ppJTcz63KHJYuLKuPwJGMDcQIulUQhbBzYU1ZlBckmCfq
         GEBHYaCmargF4OTiBkSxZv3TAO+zVitbEDF1QwaWLK5g+7+IRP4/Aw2DNk7UL7noqb9+
         d2sOq58nRcBYTR+CpERR2G+povNVrxJiCpYQQA0e/LU1XREe1RoZG+paisBryi9Aqkvr
         iuCj5HH5TXYAVrayaESsPlL1IevekRwSLo4+f7IzIqVyLevQDpoQyxH18X/prfV4+ieT
         tY49ztQlPSswPP7W8xL7iLSTajsQSmw8pxW5w3RIR3RFO36R6zYj4i9FukaYaOxvdxSL
         X15Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZJZriR4DfS29+O6wt5MJL2e4ntmNSqYE6BT7CNP+jIKT+2kflhqUjv3JV9vpnO10XchKwu1Ur1mg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPl4WsjVcrXMgmwrIvzjYPg+cBi7mWhf/iQ4qJzVa3Al/8ibke
	ylyTBYAE5VnstKspHkZLfKDpa1Aey+A0dtKtp+JF+OUsOmrzVUdpTVsEPqRfB0Y=
X-Gm-Gg: ASbGncvwUvuuY4hl3Io0Oxm9z1L9HF6YbAdCYnNlmSt0keIkznswv7yr81spNZpEbVc
	UdAX04ZYMIQWvn4MRE35zYAnc9DB0RY5S5xF2hu0Xr9xXbcnsUiG2oxJLF9+9wa6ORVoLrOWR9w
	VhOVyhNllc0xn4w+EfZYf3DcdOD4shpgPIDeP6YM1MPiQ1nDT3gm+vHU+LKETKo573vNSYU2f45
	dg9O6A40qahMP1CD1mQAJ29dw28goLXiGMKBpfgGFgAqACAIRytHAz4CyZ+HA4fqz64L//dXYqV
	y59NqQ==
X-Google-Smtp-Source: AGHT+IHb4p4BsdZddRAzW7ClEpebfRxQ8AzParhFuiFMv/11Hxp3eTNkqo2donhFNcFIFvtCV2pHOA==
X-Received: by 2002:a05:6000:1f85:b0:385:fbb7:672d with SMTP id ffacd0b85a97d-38bf57b6438mr20721730f8f.52.1737651253341;
        Thu, 23 Jan 2025 08:54:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bbc8dsm165695f8f.72.2025.01.23.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:54:12 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v2 1/2] riscv: Add "-deps" handling for tests
Date: Thu, 23 Jan 2025 17:54:03 +0100
Message-ID: <20250123165405.3524478-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123165405.3524478-1-cleger@rivosinc.com>
References: <20250123165405.3524478-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_085415_140063_02AC0B59 
X-CRM114-Status: UNSURE (   9.69  )
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

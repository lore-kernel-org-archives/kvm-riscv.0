Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD53DE77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjOTdjT2jLvpYqXc5EXtYhSgpl+yjR2u1DLhzuDcT0=; b=1/WB2qvPM4rRru
	WsSDjEnh9k5GLa2PctigvOpHwZz+xkidFD5vpmgdqNiXgMhKHtJkSAPnVMNTSm3XoqN3ko+80bWoB
	HqojfTAmWK6TloYcnY/yyIheiURgV9NEmf0PSDqjTO6c1rid1eL/L0pfNJ6FQbM7ISvUsdc1tFaK4
	ZHkPGXZMipaUbRI+p909h5cDrrlbx8QMBvYxAwJHDeUKI9hQ6HDHfIhpjnYpG3HZGkfaKyhSiFomU
	kwQPZ27kMxCyrJOZjwtaRue63Cxu/EKkB59vu1S9/1sftlVG/yeeAqixFUK+tw1pMNFujsvbyoL+v
	HBfGv0Ulu5zaVksjE02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpQI-00000001rQt-2W7d;
	Mon, 06 Jan 2025 15:53:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpQG-00000001rQH-2HHY
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:53:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21649a7bcdcso203287785ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178824; x=1736783624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=RD0K0npgkvFeay/IXdv2+HZTaaEoinjjDNOxLW2dUz/O97I0pplTT4CxOrQ3NLleYA
         iHGoLgUsOtga3OHGhjBmmFNmCpwRYdQFf1mwkZhx17TPyZ/tmSScvNP0TzJE5za1gs+a
         hseOxhBHI8BeQd9iaSoRye9WKI4LHn1Gu1ju9BekE2grgQTSEVcMP6c+Tzyn0oRsTd+Q
         udZ4SrKo++V2w3HXxawutPJEuiSuyB2MdSj6axJQSvc1Z9AskJb11HiHqp8Smwg1pnUf
         53YRI4bUGh4htJhFg8Wh73xT3KhMXnFdXYpiTxH+vEhMoBm4WGvVnYwRgKsf9x/AjmRw
         VgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178824; x=1736783624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXZJcyGHTstiDftWq4K40v7tOXTPcWP1rruCYNo4KRY=;
        b=rQFPL/RBCUHas4RsQ6uAB/+/RqW9IiEVGTS79mBJ6ziy5oguoy0Mh3p2mjRBbN6O+T
         0cBI3NCprK6+Dbm7E/bi5JoDrecOKl7JwsodylQ8DTPcw1DS+XjnGipN3EiDP7mK1IsY
         GJmi+QJ0cIIUFbLggvwdAWkLhmaqrUlu/+DCEnFgjlAbiF1Mjv+bf3vBMmEnWEvg4MLd
         tEFCLuKPKpgbANO+2uSsaAMzlf9PHBTu64Tb+Gn5sVx6Nu1G8ZkU//t8k+mOeCC8G/KG
         mGJXqxPQQ5osJW6OUB1hX9LDcC8HhU6xKuGnjRZEBteznM+h5rIy6jnwmtWl/9ZUelQs
         ynGw==
X-Forwarded-Encrypted: i=1; AJvYcCUvlxj6+nM9tP2pMdTsCUUSFpCujovHGwJjfKcyoBwgeuggEfwg+hGS23ZqxHkmnqfrP4EPmUPE5AU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznw1a9q4VvjX+csz98L3MavD7IfRPl5cnqIWKRUonBZyDsmNd5
	LCBXDtoUcjekjexKD8Hz02C6yPyZMiQMlo+KltOHpFHDApNM+GPw5sWrvMc5EJM=
X-Gm-Gg: ASbGncsm6+fQBNYSBHZkF187Bu06V2Hczb7T1zPWz3hQyJ3YeYlZ4icUqYOlqIzd2f4
	6A4Wj2mhWlWHe92g/CaGrRkuYqskJWjOotd/BI81aR8TjaobEx/SIk/nK3lSYIX6mC5FXKvqENu
	O0K1FX+Ltujo6phERv7ZgbT4MPg41UefNfMZ/T1hL4CsNU4qFx327KsVofoIPPhMqzC5MsOGZbU
	gMdD+BPMcNHJ1DRP5StA82EKy1hT0k+kEGYPT2ZsckLQQyPdUOKUS97ag==
X-Google-Smtp-Source: AGHT+IHNABQXG7BbQsU6/mtXz/rJrBzDCcciLJwgtCAhPVN4QvCcVK4iGblc8oRSLMAfda2RSAnCzQ==
X-Received: by 2002:a05:6a21:3994:b0:1db:d932:ddcc with SMTP id adf61e73a8af0-1e5e049f462mr86158615637.19.1736178823896;
        Mon, 06 Jan 2025 07:53:43 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e867ccsm28950200a12.47.2025.01.06.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:53:43 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH 1/2] riscv: Add "-deps" handling for tests
Date: Mon,  6 Jan 2025 16:53:19 +0100
Message-ID: <20250106155321.1109586-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106155321.1109586-1-cleger@rivosinc.com>
References: <20250106155321.1109586-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_075344_591423_B7564124 
X-CRM114-Status: UNSURE (   9.94  )
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

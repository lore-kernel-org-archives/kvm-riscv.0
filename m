Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63AE7719E
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMynTLmc5pqkCPAiB+p0SqNNpVNQrxns/7qTLgdukTw=; b=E08/o1zRNfBx2I
	gRAtlbUH+KZSAPSGa1Q7sUf6qFkxxVcXRdz9zlwt3+KfuuJjXW0NurElaU23m8aJJvJ+6ZyCttpNI
	ouhS2cKiv+0CyK5kbOLcf0ZaYzgQ7nfgY4VX54MFIYH+P5rXGwhhSNYD3MfL84vINUYQ/6g4YNCDP
	ptYsoxdSQpTWsf2TDWPMUGMSQnRDWAcg15XJT3AZ3UcjmxiubXoaeEvBB/O4jKwWRHsjjPZqNpuqt
	Xp+0t0Y11GHvoJGX+dVG+YTnCAYYHbbsQY0alb6BeMWGS3x06ieOwj9nu94+F4K9E/2ul5QO3kdvp
	TW7pTqQfq3zS/b4H/ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwt-0000000F4bX-493I;
	Fri, 10 Jan 2025 11:13:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwr-0000000F4Y0-3Oq0
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:13:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1060730f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 03:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736507584; x=1737112384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjgBZFa/BR8r5Er66LNA94UStT5XF8U8GTLeRsOmkfY=;
        b=fEAJ9kgaivqyUP+XZ5qGPj8slZLlTZWQYEKva0b8DZfRZ2fO9okv4qgmOpMdnlkJ2o
         ij155tD53Kc3T4evLS/xOyVP4HnzaU3u/eb4+bdIy8kJLwod3MPVQyuIaLEKaORXyJc4
         TVPR3mqMOvn19pQmfaI+bXCRBlw9zKfhZzI1kgIG+hN56cSFhdMfSyZ1+ZFrbhByb+0R
         ZSfxgd64aD0tPoSVCaEjNBKHXVA+BxeYeIYnfrw/pDd6N/3GHjMRHRnhKy3235HlawhS
         DcR3F0hua8KdONqAkhHtzHqLKD7BHiIpGJU1MejvCwXyGU2vGxiyr20whecsMKJB20wt
         4o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507584; x=1737112384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjgBZFa/BR8r5Er66LNA94UStT5XF8U8GTLeRsOmkfY=;
        b=Z2AsBvGAkvOsLACRcd4JNwiGBS/DHncW2ycJ8g1QC6uWvGLVF9xGUJPbVkL877Xd+2
         2WwFuXUqft7ekD9UR5nnYe+fHo9mRbzLsKhEBgxI65l2G/bSFnOpk/wOH6nNcz81pVUH
         934BdMSJg5ksGscs9mEQ+NhiWe/3prf+DBvUU0J9Qr3M4raZpT8L21lwrx/goCjuuQmi
         u9s90o/9ZsbVLVBrm50PiToE8+ReJYBJAz2FyFIjxq+C01GFKGLrQnrJO6x4WL20zIz0
         2ROKEwSsQEgwJJFXvgZVtAzX2wxB1R1aFRpJaHVV6EAQZQC4SVEFBr6a2M9HVKUAZ+MI
         mwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsHOFKsV1BW2/Kx7KKtA0e4hHrIwmKOLFDuDDz2u8i4W/YNqgMU5GXiXViL5r/dW6Y0RWZ7UdDNto=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpFjWqp+TEuwhu/auMU/pK4VIRDIItnd4fv9A2aRNWBG3+9UtE
	dTW6DdmmrLyX/9L6P4VN8uOU/ZO/7vk5B/VNWfzPU+NT4pNJim6iKoyr9s/dUNA=
X-Gm-Gg: ASbGncvKHFoE6+lDcxitH7TNweLq/XQ19K+G/m1KWyMAn6gOb4HSEhu3/Q43qE2N0n+
	b88y/ulh/9o45OkQ0kAL9YNUUW4E0rHj6Hacl3gLN6GVBob4CWMFL8ypGt72T9ECVXVZdHWMcFb
	aqtcB0n2WYnR/nv+NRWDyzlEBuEkwm9NNbzA8kr5nnOG9+DlW0axU1sVqpvTcRAwSogwKfR9ULb
	POUEuDP8AsGgsZ0Hgz1kQdKcw1+way8oiMEJOIxJ93iF06niEsqI26gUw==
X-Google-Smtp-Source: AGHT+IE9GN0aTbpT588uzWry7FfnQXEXjdNpSHyruEGOTIgns0gLO4iWOnowhU2urXFRfbKNdQo5gA==
X-Received: by 2002:a5d:6c68:0:b0:38a:82a3:395f with SMTP id ffacd0b85a97d-38a872c93f9mr7248319f8f.9.1736507582807;
        Fri, 10 Jan 2025 03:13:02 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm4344459f8f.50.2025.01.10.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:13:02 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v6 3/5] riscv: Add "-deps" handling for tests
Date: Fri, 10 Jan 2025 12:12:42 +0100
Message-ID: <20250110111247.2963146-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110111247.2963146-1-cleger@rivosinc.com>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031305_851471_5F37E9F5 
X-CRM114-Status: GOOD (  10.46  )
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
ZWZpbGUgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxl
CmluZGV4IGFmNWVlNDk1Li41MTdjYjBlNSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysr
IGIvcmlzY3YvTWFrZWZpbGUKQEAgLTE3LDYgKzE3LDggQEAgdGVzdHMgKz0gJChURVNUX0RJUikv
c2lldmUuJChleGUpCiAKIGFsbDogJCh0ZXN0cykKIAorJChURVNUX0RJUikvc2JpLWRlcHMgPSAk
KFRFU1RfRElSKS9zYmktYXNtLm8KKwogIyBXaGVuIGJ1aWx0IGZvciBFRkkgc2lldmUgbmVlZHMg
ZXh0cmEgbWVtb3J5LCBydW4gd2l0aCBlLmcuICctbSAyNTYnIG9uIFFFTVUKICQoVEVTVF9ESVIp
L3NpZXZlLiQoZXhlKTogQVVYRkxBR1MgPSAweDEKIApAQCAtNDQsNyArNDYsNiBAQCBjZmxhdG9i
anMgKz0gbGliL3Jpc2N2L3RpbWVyLm8KIGlmZXEgKCQoQVJDSCkscmlzY3YzMikKIGNmbGF0b2Jq
cyArPSBsaWIvbGRpdjMyLm8KIGVuZGlmCi1jZmxhdG9ianMgKz0gcmlzY3Yvc2JpLWFzbS5vCiAK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIApAQCAtOTMsNiArOTQs
NyBAQCBpbmNsdWRlICQoU1JDRElSKS9zY3JpcHRzL2FzbS1vZmZzZXRzLm1hawogCSQoQ0MpICQo
Q0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1EUFJPR05BTUU9XCIkKG5vdGRpciAkKEA6LmF1eC5v
PS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChBVVhGTEFHUykKIAorLlNFQ09OREVYUEFOU0lPTjoK
IGlmZXEgKCQoQ09ORklHX0VGSSkseSkKICMgYXZvaWQganVtcCB0YWJsZXMgYmVmb3JlIGFsbCBy
ZWxvY2F0aW9ucyBoYXZlIGJlZW4gcHJvY2Vzc2VkCiByaXNjdi9lZmkvcmVsb2NfcmlzY3Y2NC5v
OiBDRkxBR1MgKz0gLWZuby1qdW1wLXRhYmxlcwpAQCAtMTAzLDcgKzEwNSw3IEBAIGNmbGF0b2Jq
cyArPSBsaWIvZWZpLm8KIC5QUkVDSU9VUzogJS5zbwogCiAlLnNvOiBFRklfTERGTEFHUyArPSAt
ZGVmc3ltPUVGSV9TVUJTWVNURU09MHhhIC0tbm8tdW5kZWZpbmVkCi0lLnNvOiAlLm8gJChGTEFU
TElCUykgJChTUkNESVIpL3Jpc2N2L2VmaS9lbGZfcmlzY3Y2NF9lZmkubGRzICQoY3N0YXJ0Lm8p
ICUuYXV4Lm8KKyUuc286ICUubyAkKEZMQVRMSUJTKSAkKFNSQ0RJUikvcmlzY3YvZWZpL2VsZl9y
aXNjdjY0X2VmaS5sZHMgJChjc3RhcnQubykgJS5hdXgubyAkJCgkJCotZGVwcykKIAkkKExEKSAk
KEVGSV9MREZMQUdTKSAtbyAkQCAtVCAkKFNSQ0RJUikvcmlzY3YvZWZpL2VsZl9yaXNjdjY0X2Vm
aS5sZHMgXAogCQkkKGZpbHRlciAlLm8sICReKSAkKEZMQVRMSUJTKSAkKEVGSV9MSUJTKQogCkBA
IC0xMTksNyArMTIxLDcgQEAgY2ZsYXRvYmpzICs9IGxpYi9lZmkubwogCQktTyBiaW5hcnkgJF4g
JEAKIGVsc2UKICUuZWxmOiBMREZMQUdTICs9IC1waWUgLW4gLXogbm90ZXh0Ci0lLmVsZjogJS5v
ICQoRkxBVExJQlMpICQoU1JDRElSKS9yaXNjdi9mbGF0LmxkcyAkKGNzdGFydC5vKSAlLmF1eC5v
CislLmVsZjogJS5vICQoRkxBVExJQlMpICQoU1JDRElSKS9yaXNjdi9mbGF0LmxkcyAkKGNzdGFy
dC5vKSAlLmF1eC5vICQkKCQkKi1kZXBzKQogCSQoTEQpICQoTERGTEFHUykgLW8gJEAgLVQgJChT
UkNESVIpL3Jpc2N2L2ZsYXQubGRzIFwKIAkJJChmaWx0ZXIgJS5vLCAkXikgJChGTEFUTElCUykK
IAlAY2htb2QgYS14ICRACkBAIC0xMzIsNiArMTM0LDcgQEAgZW5kaWYKIAogZ2VuZXJhdGVkLWZp
bGVzID0gJChhc20tb2Zmc2V0cykKICQodGVzdHM6LiQoZXhlKT0ubykgJChjc3RhcnQubykgJChj
ZmxhdG9ianMpOiAkKGdlbmVyYXRlZC1maWxlcykKKyQoZm9yZWFjaCB0ZXN0LCQodGVzdHMpLCQo
JCh0ZXN0Oi4kKGV4ZSk9LWRlcHMpKSk6ICQoZ2VuZXJhdGVkLWZpbGVzKQogCiBhcmNoX2NsZWFu
OiBhc21fb2Zmc2V0c19jbGVhbgogCSQoUk0pICQoVEVTVF9ESVIpLyoue28sZmxhdCxlbGYsc28s
ZWZpLGRlYnVnfSBcCi0tIAoyLjQ3LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

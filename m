Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B2C35FF1
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foigLhBPgt8618isBj1WBXt9+ZB/OfjPDVm5mes2O7M=; b=vCdYbhra7WHh84
	nre91p7h/qUb5E4l6G8uYx1UrbhsAikpW5w6lqAl2t0JGDpSIgNRQvIWg6UCbTK5IqvY9AWeLdpcd
	ZpTEdRbIpcV3sjMqoiNHbzF4Obu1nCKOoOBCuCLOOiJ5ya7lN42dCBP4GbQbwh+lytjg3Tq3YSjqn
	OipwZSwyxSpOb81imi6hszsiFAm019dnIvt/S9hpaaNJjiK8tZFoR3E8I6xdlAfZsh/UCtfoh792G
	ox3/iIpLq7+VKyOS5DXfX+uz8akgTjZ4LWFQlhq7fcJR/+M9gaX7lNMyyWPvhxQTVUOn0MzxEYAh0
	GYQU4E/U82hNqKlphbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLr-00000003FtW-1XFf;
	Mon, 10 Mar 2025 15:47:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoa-000000037VT-1slI
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2254e0b4b79so11951535ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619592; x=1742224392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ehbEB4G2M6rMKgF63InF+3qW6jpnoI0lm2nt0Msdk=;
        b=WRJ0bn5o7dB8+ETWYOTd5YzUgD/f8JPkT3cgJeFguST1W5X6kPDFd0AqxTSz/SmbNF
         m1U/+TL1QPNM03w5Hgr6fkVJFGIEgdXwrKxVpmFGzcoGTb37E2hgEsy6QVrEoI+4rZxM
         l+TQKNTkBnhOS1SyPGDoc80tSC6gPqU4aJobl2rigCw/GHPfZXeuqg68XHgmfe+qrRfF
         0E3TrKSelBzkVoNNwjYKZsjr4W1psnIlAolzrLEODI2Yu7QEmE40g1iii71BifRdteKE
         Qsty3a7JCQt5uRNwd8YnyU5Yo2RVeRchnKILFhjapEVpcw96qSimJ0nZXYl0f+OMvcJo
         obTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619592; x=1742224392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ehbEB4G2M6rMKgF63InF+3qW6jpnoI0lm2nt0Msdk=;
        b=K5WOX/dGJhKF5XP+ao13dVnafGgslLPPMo+ORHgweerzMaCpTDFaShTtpayoVdKTob
         6CJ8PvV5ZErbP1TYhCGL7fEoRSyxXa7xw+4kPN/G6py4bO4UGW6nEVZNT6Y3YIjYtIx6
         Gu4f7Z/Wv6DvJyabhAtT/Eqqb0oENrxruLXCphiCmF2mmB/BAM/MXtoJssFlxs/nuWab
         Izjs2i8qwT8agsPan8+G5xizlVtGyodTlHXzL2B43AwrmbeCwF10Uiibds9ezS/vGjJC
         Z6jmbLxEhxDIbvXEsurMvz18rsUGirJ5+qHp6RYhgAEjairUZ7aXT/kUQ7+5x+UPAEgG
         eiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5gJo8Uk8SST41PkCkuKJ/cJkNPvK8RkNFiMIsZSm04wGYf91mlTfShQQ7yF6FLS43PrKx7aEm2Ek=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD2adac8vFaLWQTUgp26j2sfZbFIHVtm84xAk45cwP9+49aWmX
	L/buAb5jqEtA4GZZ3K7c3SgVSRrriDjEW6sxPru7Inf39J4JKjvbxOnY+a7agPSNLj+ExPCc57C
	RA5M=
X-Gm-Gg: ASbGncuyXUp4SIz+kHDzrQeN94Id1SdjqN7xCDgtuecC8yTqeAkjYtgD2qp46kTawJM
	6jv/eDeJWTT/jR9MY8yyUOW1CNlnMh+ESNpltzL0/XBmwrmysMag3aLlSQHYpCsChsUjtmmkjUt
	7KWJIsa7qsY9EV1MCKKnUGLKg1gNzBbZ/fCcSTVY+LSWFqCknff4FS3NsMDLud9z01Crue/pmd8
	lfFmDK+el+8tGZvyqCXjY9MRkiiEL6C/a5B20hFWMssHT0Hq6QE9eCbQeKtKGAWt33JmGBYRZpv
	1iNOfnlsQemUNOQ9CAw7eUUH/uyjIw09x+hrhCdpDo2/Vw==
X-Google-Smtp-Source: AGHT+IHx06QKyqqktCp5VtJUo5IN0vcBDSsl9L3/ywFUKF9aCYPEgmbUbCQl4AVArEAbrJmDgZ6oCQ==
X-Received: by 2002:a17:903:2405:b0:224:24d5:f20a with SMTP id d9443c01a7336-22428bfdba7mr268684275ad.48.1741619592004;
        Mon, 10 Mar 2025 08:13:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:11 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
Date: Mon, 10 Mar 2025 16:12:10 +0100
Message-ID: <20250310151229.2365992-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081312_484651_A7766437 
X-CRM114-Status: GOOD (  13.48  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAyNTY5MTBkYjEzMDcuLmFmOGUyMTk5ZTMy
ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMKQEAgLTI5OSw5ICsyOTksMTkgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2Vf
djAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOworCiBpbnQgc2JpX2Z3ZnRfZ2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKIHsKLQlyZXR1cm4gLUVPUE5PVFNV
UFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJ
cmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJ
X0VYVF9GV0ZUX0dFVCwKKwkJCWZlYXR1cmUsIDAsIDAsIDAsIDAsIDApOworCisJcmV0dXJuIHNi
aV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7CiB9CiAKIC8qKgpAQCAtMzE0LDcgKzMy
NCwxNSBAQCBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1
ZSkKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1
ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0
IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BO
T1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NF
VCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7CisKKwlyZXR1cm4gc2JpX2Vy
cl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogc3RydWN0IGZ3ZnRfc2V0X3JlcSB7
CkBAIC0zODksNiArNDA3LDkgQEAgc3RhdGljIGludCBzYmlfZndmdF9mZWF0dXJlX2xvY2FsX3Nl
dCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwKIGludCBzYmlfZndmdF9hbGxfY3B1
c19zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MsCiAJCQkgIGJvb2wgcmV2ZXJ0X29uX2ZhaWwpCiB7CisJaWYgKCFzYmlfZndmdF9zdXBwb3J0
ZWQpCisJCXJldHVybiAtRU9QTk9UU1VQUDsKKwogCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xP
QkFMX0ZFQVRVUkVfQklUKQogCQlyZXR1cm4gc2JpX2Z3ZnRfc2V0KGZlYXR1cmUsIHZhbHVlLCBm
bGFncyk7CiAKQEAgLTcxOSw2ICs3NDAsMTEgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkK
IAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVi
dWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9CisJCWlmICgoc2JpX3NwZWNfdmVyc2lv
biA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkgJiYKKwkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9u
KFNCSV9FWFRfRldGVCkgPiAwKSkgeworCQkJcHJfaW5mbygiU0JJIEZXRlQgZXh0ZW5zaW9uIGRl
dGVjdGVkXG4iKTsKKwkJCXNiaV9md2Z0X3N1cHBvcnRlZCA9IHRydWU7CisJCX0KIAl9IGVsc2Ug
ewogCQlfX3NiaV9zZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwogCQlfX3NiaV9zZW5k
X2lwaQk9IF9fc2JpX3NlbmRfaXBpX3YwMTsKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

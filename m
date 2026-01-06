Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548A9CE9D7D
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6MOrvELNgNOuxEwmAi4Suqr6UZyNb9eVEI7RSSJc+s=; b=KFfWEPgmANVyxU
	fJ+TzkHXstG16AvgwvYN5oV8hXWacIVp9HqfjvVxJks+Tw6VdL1m+ZpaiTgvw3wfHy+Nz6UO1n1Gt
	xeRy5mA6REXsUe/r7N1qnCfLVbaZD91uwC9+ILM2OGZ1MCAZm5/NliebjND1bQYtT9dc8FPDstkae
	+S0EhVFCnuvUWG1Xreel40mM69p/7VlTvfu+KCYDXYegu3rGqmdTT0+JWPgG5EJ6TjQBlDnqGseWP
	vAnjOsr4+CjcgmRofzSJnyIqAkn/L2vuNI55pYR1/79ceMi7XGhyt7W0VDZM8+pa0IbLrBxoiX340
	q4pkygASrL1aRSGJrpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA1Z-0000000DV7P-04gm;
	Tue, 06 Jan 2026 16:35:13 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA1W-0000000DV6e-2StF
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 16:35:11 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7c6dbdaced8so930481a34.1
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Jan 2026 08:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767717309; x=1768322109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNrz9UQpAZyojBAeX05y5M58klvOpfZIZjcce2E7lpQ=;
        b=x2zCEenZox87b81EffLd/5c4QDEXx9NrkettSe7O8bzgWaKS7qJyirSDNrWoWGDBTJ
         gvkXK/xG2zbbdZdMHy2sTaNTlGn3k7hvpLpI7aWMk7s6jQGTWDyOR7+BXcfJcfWkvJak
         rr+TWBg3nBW7L2xByhk5ldrpjkJs1tiRpqSZipMy0Qw3e7K6kd1tS+emFTC7e2DsBrla
         qvqeI7YDV+SRPn2bDKdnf2wyTJFRGdbKufoNdTTs/kPYiAt219KrbFMm6to+6cnV1BFP
         QNwymczDgTCbqb+bqHZ5GeYdR0uqz/eJDdFKeKd26/8mElobooPDN+uPxxzYiosa/KhQ
         XU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767717309; x=1768322109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNrz9UQpAZyojBAeX05y5M58klvOpfZIZjcce2E7lpQ=;
        b=JQxnu2KO77AcOsOyatPnmLncISGcF2wHhJtMXoD+757guqtB9/oKDAT5Wwsdw2CT8a
         npTUzJ6A6D/A20B8cgB+uLgxO9JRjTMCzJ5Yt2eLCr6ksyeBy2sMrZSgzSnY+OAS7ylg
         9A0at8yUwL4U2aSU6wwBHYhXuHvM4s9DjFQBrBGfBRV1xVZECA34phlt2ogTycmNQJVp
         eMUv11luIQF8Qn8UAnyFqa6VIHVpJFjONJqLM4OsOphKl6zjwz8VburTFkLG7Qx9i4Nk
         xuUl1sr5eic0j2yuis6uNad8641LhkOh59P51xD8wSbSwWa6cZB6EfpaGBCZHQklu8K2
         P0OA==
X-Forwarded-Encrypted: i=1; AJvYcCXWvHRHphoTgSk8RcpszvL+643TPLkUl9vGuv3IY5l9yJP99QVYwPW13wIECFtbTShfLAj/VS1BJ74=@lists.infradead.org
X-Gm-Message-State: AOJu0YytqukPIf5gp8ISnwX2aE7225CbHLYMc+aqFKZYa8SuDVkGZr1i
	hts8mITHUH9UM1bnRX1Wwn+j/+prlHF623CCw3Oz0pBEoxz4t9bAKLjjeVwufFD8ceeqwX/IWZ1
	k2+O4JRS1l3/wcu73zL/b2DlpLRh4pay/GuB1UbSRoQ==
X-Gm-Gg: AY/fxX4kIynpn72CgxwC3vfkSynl92cfI+1W3syADU2MAVKm/c7s4xHzgEnDSr7B/6t
	SRTHBWi38Oag03g/kffmnUJmx+CHfHabvPoz7+TcV8gzYeC9M02PHCtrEPWzLFXazk7LsDho+ER
	88RQ70fSGtZVS7xDTyHzIo0JEqpkqKIqM7JXBmxJrQnJIKJ8v0OWildnqrMC/3b7GKrAnCfE4Mi
	P+3RY2NysTuokorl8KufoQcxr/phXoejnJU/dWMFSESm3BM7gHhK8/70QC+dERTTLc/mrYClJZn
	SmPJnSTe22erqF/kxjSjP0tCmoncUNW/fVuSLhIbkA6Mo/dg5N+8yHl07g==
X-Google-Smtp-Source: AGHT+IEqXxTBeH3LP0fUVizISuCkdADz10TXUBGRVWD+OKCNI8kCKzHUOCYj5zq7rrrDTSe7deN3OOyJ+Sim2FJxOUk=
X-Received: by 2002:a05:6820:4908:b0:65d:2f7:6eb5 with SMTP id
 006d021491bc7-65f47a9ac10mr1471540eaf.66.1767717309018; Tue, 06 Jan 2026
 08:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20260106162848.22866-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260106162848.22866-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 22:04:55 +0530
X-Gm-Features: AQt7F2om0UlRUlewDfBuWexms2k5z-xmHfO0JSMf-AgqjjVg_PjC4qOz0utW3LY
Message-ID: <CAAhSdy1w485+mTNCmX+KgQVnLr5iyDyPLm5+w2QwA+SxQ-2mVw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix __le64 type assignments
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, palmer@dabbelt.com, 
	pjw@kernel.org, atish.patra@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_083510_620590_43B1A97D 
X-CRM114-Status: GOOD (  14.75  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjU54oCvUE0gQmVuIERvb2tzIDxiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrPiB3cm90ZToKPgo+IFRoZSB0d28gc3dhcHMgZnJvbSBsZTMyL2xlNjQgaW4g
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gYXJlIGdlbmVyYXRpbmcgYSBudW1i
ZXIgb2YgdHlwZSBhc3NpbmdtZW50IHdhcm5pbmdzIGluIHNwYXJzZSwgc28KCnMvYXNzaW5nbWVu
dC9hc3NpZ25tZW50LwoKPiBmaXggYnkgdXNpbmcgX19mb3JjZSBhbmQgYXNzdW1pbmcgdGhlIGNv
ZGUgaXMgY29ycmVjdC4KPgo+IEZpeGVzIGEgbnVtYmVyIG9mOgoKcy8uLi4gbnVtYmVyIG9mOi8u
Li4gbnVtYmVyIG9mIHNwYXJzZSB3YXJuaW5nczovCgo+Cj4gYXJjaC9yaXNjdi9rdm0vdmNwdS5j
OjM3MToyMTogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIF9fbGU2NAo+IGFyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYzozNzQ6MTY6IHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJpY3RlZCBfX2xlNjQKPiBh
cmNoL3Jpc2N2L2t2bS92Y3B1LmM6NTg2OjE3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBh
c3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmM6
NTg2OjE3OiAgICBleHBlY3RlZCB1bnNpZ25lZCBsb25nCj4gYXJjaC9yaXNjdi9rdm0vdmNwdS5j
OjU4NjoxNzogICAgZ290IHJlc3RyaWN0ZWQgX19sZTY0IFt1c2VydHlwZV0KPgoKUGxlYXNlIGFk
ZCBhIEZpeGVzIHRhZy4KCj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9uYWNsLmgg
fCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gaW5kZXggNDEyNGQ1ZTA2YTBm
Li4yNDgzNzM4MDI5Y2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
bmFjbC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbmFjbC5oCj4gQEAgLTU4
LDExICs1OCwxMSBAQCB2b2lkIGt2bV9yaXNjdl9uYWNsX2V4aXQodm9pZCk7Cj4gIGludCBrdm1f
cmlzY3ZfbmFjbF9pbml0KHZvaWQpOwo+Cj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAtI2RlZmlu
ZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlMzJfdG9fY3B1KF9feCkKPiAtI2RlZmluZSBjcHVf
dG9fbGVsb25nKF9feCkgICAgIGNwdV90b19sZTMyKF9feCkKPiArI2RlZmluZSBsZWxvbmdfdG9f
Y3B1KF9feCkgICAgIGxlMzJfdG9fY3B1KChfX2ZvcmNlIF9fbGUzMilfX3gpCj4gKyNkZWZpbmUg
Y3B1X3RvX2xlbG9uZyhfX3gpICAgICAoX19mb3JjZSB1bnNpZ25lZCBsb25nKWNwdV90b19sZTMy
KF9feCkKPiAgI2Vsc2UKPiAtI2RlZmluZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlNjRfdG9f
Y3B1KF9feCkKPiAtI2RlZmluZSBjcHVfdG9fbGVsb25nKF9feCkgICAgIGNwdV90b19sZTY0KF9f
eCkKPiArI2RlZmluZSBsZWxvbmdfdG9fY3B1KF9feCkgICAgIGxlNjRfdG9fY3B1KChfX2ZvcmNl
IF9fbGU2NClfX3gpCj4gKyNkZWZpbmUgY3B1X3RvX2xlbG9uZyhfX3gpICAgICAoX19mb3JjZSB1
bnNpZ25lZCBsb25nKWNwdV90b19sZTY0KF9feCkKPiAgI2VuZGlmCj4KPiAgI2RlZmluZSBuYWNs
X3NobWVtKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLS0KPiAyLjM3LjIuMzUyLmczYzQ0NDM3NjQzCj4KClJlZ2FyZHMsCkFudXAKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

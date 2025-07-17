Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CFC83F1B
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nsVppJXtNiHzm95cl78J88GnhflCVinRqpwhKk+XJE=; b=Bp/u5b/BHV8QHe
	84nSbJrYxRXBt8PkMkFw+bm3CP7sSepcxy+UvaWM/wdJiwiOTMVWjHY0ihfYMPlTVPAYmb+9VuDvI
	7GEDkoE1fSjC3iH7UyA21XTErGvPG9p/pVxJr/sbfQ6SlzdyDnMs20Rnr5GJVG+zwQO0TkQs/hoPf
	Wc0nhgjlF9/joMit43s1MUzx+ScveWEf4LILuc+Pil094f8qpASwKcOXHD1RAHpNji9YeqOHCIDfp
	FLgDhkHU8k801NDH+S3p6VxiZU1vb1NcXKdEWnVSOEVdowArW5cvrXEexvw3UobwG7zixg5XmnVuT
	awH2MEfImmrK1nHHa6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORh-0000000AE5j-2plz;
	Thu, 17 Jul 2025 13:14:45 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNKX-0000000A3sM-1WH5
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 12:03:18 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-879c214fe6dso24042839f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752753796; x=1753358596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdczZfWBYlBsJGjMXmJfIpSAsQhEzzJLRKIMejj7UJA=;
        b=2lQu/+IMszzm720qgaZTR0yNVTYfoadBJEPbWJ/KSL6GZ2Gnam0CpL1/o2j78+yYgw
         IZiZO7aPdgCdKbUid5FDwv6v0Vjp7nUmFACobWMv56JCxJy6k8NAF/AERf0bV6B5CTsN
         cQL0hf8dI4RKLxAk/L1nb3dlwSm2iPG5ox0rhW69lGIpdsM1Rq/shoa6OjRA4z9a2QET
         xfkIgvAxB8B+IUTXHfCS+3H1OzhwITshk9xRl+GD1VeQU6KS+TxAhQAgLSgjHqKbZD1q
         FK6pyhcazFwpbmr0W0jhzfGoHTl0yQyfd2/KkImR16kBbL/URRCCwWf5mpPSZJsXQcPS
         iCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753796; x=1753358596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdczZfWBYlBsJGjMXmJfIpSAsQhEzzJLRKIMejj7UJA=;
        b=HCUYqZRFP8N0k0qX9U5ZYtYR8HxGnsgBvtnIgAmtNGx+OAW3nnM4Vy8O3psgYu5D9r
         dvyeQv1Q/hkuK8geB8AcfB1gXdVhkQasssehDUx/EJDHaTi1KbyrFYYvB1TVJbw/Cx1d
         PPCPvJkjnFlpgmtYUjP61ngUwOED0nQpsHByYrlXSS3B9V9rula2lITTGKT0UUAd6U+t
         H3okY192pgbSP63xWDbqMfEFv1jothesCnUwbJU4BO8oXzM9MTBvLft0SLpjktPMmvMo
         bn6+NcUmycT2GzuvgAy9KaBUjtChmQPp54KC6kWa+83JtLmvPIIc9B0tZrUtuwpL1WvY
         G4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkUV67t/agBlLfRskyiQtoB4xEAOXk1uTgS6WGHe+y41qEZTPhQyQosXiSs0vV8V/kAkGgEs7gxNk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8LZxU3xKsFQWhSW6LZnH5/Q9mz0+s4gqqfJwYrKbbYwoPEM7f
	9BfFXsrp1ZMzJXRHRk7T3fdruCqE3pF3DjP5CcQEw8dchP7t2mGyhZHC2B1EGiGUndEyyGpC3V4
	VQykwks92hFMXyk5e6mYyl/4/IRGRZLDP73lfdcpavb4j/ZXionSIzi4=
X-Gm-Gg: ASbGncurNSRvuwN2e/aWMSqS26KUmr4x9d3N+EPNMa93H1Xawd4VsIlv2FUZU1H7QkB
	pkIsLYd6/WwGjVl7xTFsut8tdjVRbSM+U7sv1dcTeAKHyKWoNkccvQDfCfCCHRuphvLiR/A8qrl
	V3CmHTgqskqmXQNQSpo2G2e56MHM22YTjlm2ljLKC0nYUCZaNvudM9qRc20kKtKvaV1qXoK3YT0
	uv5RLFexTO+wq8=
X-Google-Smtp-Source: AGHT+IEIPZpywuhs1CvUOSh4UNExbMIYSBBP4YpBBndeSSlxDKRJE4v/uEqa/SeaPqJ739w3Q/p24P3FjwMeUrY6uKw=
X-Received: by 2002:a05:6602:6016:b0:875:bc7e:26ce with SMTP id
 ca18e2360f4ac-879c2519d3amr647026439f.0.1752753796201; Thu, 17 Jul 2025
 05:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
In-Reply-To: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 17:33:02 +0530
X-Gm-Features: Ac12FXzaP5e6ToyKGdPw9vauuEDoz4G5gaSf7T3TkFpqI1hEBh5Tf1rGli--9AE
Message-ID: <CAAhSdy0BvhZ_TsaKEK3j+0kNQYRekVyfHOFh=eAkj2H7Znrm1g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050317_523222_C672D89E 
X-CRM114-Status: GOOD (  15.54  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMzozMOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gVGhl
IGNhbGxlciBoYXMgYWxyZWFkeSBwYXNzZWQgaW4gdGhlIG1lbXNsb3QsIGFuZCB0aGVyZSBhcmUK
PiB0d28gaW5zdGFuY2VzIGB7a3ZtX2ZhdWx0aW5fcGZuL21hcmtfcGFnZV9kaXJ0eX1gIG9mIHJl
dHJpZXZpbmcKPiB0aGUgbWVtc2xvdCBhZ2FpbiBpbiBga3ZtX3Jpc2N2X2dzdGFnZV9tYXBgLCB3
ZSBjYW4gcmVwbGFjZSB0aGVtCj4gd2l0aCBge19fa3ZtX2ZhdWx0aW5fcGZuL21hcmtfcGFnZV9k
aXJ0eV9pbl9zbG90fWAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlz
Y2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDEwODdlYTc0NTY3
Yi4uZjkwNTlkYWMzYmEzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjQ4LDcgKzY0OCw4IEBAIGludCBrdm1fcmlz
Y3ZfZ3N0YWdlX21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZBVUxUOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBoZm4gPSBrdm1fZmF1bHRpbl9w
Zm4odmNwdSwgZ2ZuLCBpc193cml0ZSwgJndyaXRhYmxlLCAmcGFnZSk7Cj4gKyAgICAgICBoZm4g
PSBfX2t2bV9mYXVsdGluX3BmbihtZW1zbG90LCBnZm4sIGlzX3dyaXRlID8gRk9MTF9XUklURSA6
IDAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3JpdGFibGUsICZwYWdlKTsK
PiAgICAgICAgIGlmIChoZm4gPT0gS1ZNX1BGTl9FUlJfSFdQT0lTT04pIHsKPiAgICAgICAgICAg
ICAgICAgc2VuZF9zaWdfbWNlZXJyKEJVU19NQ0VFUlJfQVIsICh2b2lkIF9fdXNlciAqKWh2YSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtYV9wYWdlc2hpZnQsIGN1cnJlbnQp
Owo+IEBAIC02NzAsNyArNjcxLDcgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfbWFwKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+Cj4gICAg
ICAgICBpZiAod3JpdGFibGUpIHsKPiAtICAgICAgICAgICAgICAgbWFya19wYWdlX2RpcnR5KGt2
bSwgZ2ZuKTsKPiArICAgICAgICAgICAgICAgbWFya19wYWdlX2RpcnR5X2luX3Nsb3Qoa3ZtLCBt
ZW1zbG90LCBnZm4pOwo+ICAgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbWFwX3BhZ2Uoa3Zt
LCBwY2FjaGUsIGdwYSwgaGZuIDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bWFfcGFnZXNpemUsIGZhbHNlLCB0cnVlKTsKPiAgICAgICAgIH0g
ZWxzZSB7Cj4gLS0KPiAyLjM0LjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK

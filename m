Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067C606A687
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ig1mbKTz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l40/8bx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WYtVZSryJzKaAenLoIzBHK8/i8CdkN5tz5kpfVPniNk=; b=ig1mbKTz/lp7YWLbdprffV7LcO
	oyZSe5sb496uVj70HomWVOvyEawvQPbIGW7kAb5A5bSAHe7adDZYUWcMtUnenq9A29RXc1GNwRpJe
	8prXVZ2/Pcmkif8i/t9inwld2pJ3+lgxxD18CTv4jQcsSwMfE6Vydj6mpnL1+Q91kFLho18aq0liL
	BNusI3VDuLMaS7Day93tvvVXHi8uu1ORvk4OO2hn2/AZiA+YqYCU7XVac04EHFn17gOVlU0iwmgwJ
	Eb19DQxY0+S7wVl2XzzHHlq6KHYCsy2rtj0W41MQjd+awXyFeT+e+a5mo2xzTZRa1l9+dsRfrlgFX
	O0vBRwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF2L-0000000AN7j-1X2V;
	Wed, 25 Nov 2026 15:36:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF29-0000000AN4s-3hPW
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 15:35:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so3715665e87.0
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Nov 2026 07:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620943; cv=none;
        d=google.com; s=arc-20260327;
        b=sAfxd18Shyz5b+dNkvaCO1vS0xIHGUCTJMOnSigvfX3m6H4Mjw2Xt2tVHH6Dga9ePR
         5z8hfm7YcGYZd4qjKhVWbnKgl041pXaDJGNC0e9UokiaTU7rspFQYYS5E44mLaElWjD9
         RMM113yb3GRM2r7uA44MpEcRv1/FMfFUKQ4Aj99DTJsCx+VehTtU4AurdQuY1ubHhNmb
         BFFXPB3eHF7f1yrls3peyoJ5Er1TO0SuZO82n5BXU8LLBv84h0Slxt68HNxBc9vXn5w3
         xGDAba7RJAoJTelw7SiOgROrB6g0GbgMDPsog9DMt3aGEZLNN+FxNEddSL/doUF2Z3M2
         rsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        fh=LYVBGhwG9moVtstSxGXAoJpOSgsq5eDwKJYE6CAFsQI=;
        b=g43F6JnzJDEhxa9mA7A9f5DKUyTZU4G0eO8CnxLkI2H162qnXJIXiDW1Lva8pDA9TF
         DzltHysahvOPOLxELqonul3RybedliMWSVfNK/u8aANeAfCbS98CwXQPa4eBhixSGMQt
         TCmZnAT0oJ61q5xmPWfYbK2drodyVzvItwByM+rImouMt4MTJp6zREDO9k/ozAr5oosI
         aqjnxEaTsDjQjkswk1+zY0S5JYgp953cVuNdEshQloj7/vsguLdovA7sLQ4DQILW8cfT
         8PFegutvUyZxTftWdRNYDo0BktNW43t+Qc9e6U4u7zgC4WV8yEWH4yFHDlhKQ3mjihac
         5SsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795620943; x=1796225743; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=l40/8bx1BE5JLoqvEpt8O+EM6ffxIDv4R78xBI44ZFtx0tMBWKZjj6FNOgpw23aYKb
         7mAdFlQKm1irmHw7TWrJoYz132GMdMzGcSFwbYKbNOBRzeXcr1HHqz/kzUWRnN9dRi5i
         D3yBne9VXwQaFrTWgPxU7KQZsb07yZiMqq8vaPp9DVd1XAnrOI6UL+z2heC9RZV7kQKz
         +lyICFCMQIEnlPklyNT3NyRenqeYLrbaNV3F6ExNG1EBGHpO+jpKyaZwO0zkThaQoNFl
         iThPlJ3OElO7RdfTKW9sUe60cNM3wYyoHPKmSNfCdltBSPUP4UkNWcGIbrHHJEj+NAmO
         GGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620943; x=1796225743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=APCL/c70IsucToIUKxkHzpacuUnHDP5RKA1XoShRxFleD7SCLpLozBQHNQLrKif6Q/
         P79UtTN+Xi1FUlTw5nG//5ufBIT0nj8OLdRSj11M6MuVeXETUmo1s6p6dknIvBcebkgK
         bymuQa8rb93StFx8vcP2lRhbP75lId42NYz7NU8Kvycqn/Z12NZ+jkanad+KgIslbNTN
         9v5Oi/0f0sV75rnSnS9OBedCSekx7b3z25Cvn5J8LLXk8MMQrR3gHL2ulmetuySNtDlM
         3IBTtM6MOLvkQ3YuK+BcYhgp1yNJO6uOAwJj5TKIJlHhc33fLtGdywMiVCbWAPP7/Fb1
         tnDw==
X-Forwarded-Encrypted: i=1; AL+hErFJlwPLYm9yQS/OhTSFCJHK1N0+eTtUc/n3zCRc+ktNLo2ivRsH+r0yzRQUNc6uqJuLk/wJLwdfXm8=@lists.infradead.org
X-Gm-Message-State: APuU4Z98s72t0YDSHDny6kyGzIipRephZ2307iL6jCtweQ7IzGVOxM3S
	EntCAs2eYQuP2g6aCrgsjgk4Ruzgx3HIoZJ+L4NPl252QnoacpGwz6MVmVx8vmC0F0N0qvKOTuV
	H40c2vXBalIkuUCLN0XqSH7gSAUNYgFZQi7st7wE1yqtzwVLxXjZK
X-Gm-Gg: AZFdTZcwk9U9EIwoOhp8EJ57eM0MX8/tc/UltkWxePvNzjg7V53ogYNyBWhQiHSCw9w
	+4Dj8TK+AKyNjyi6sL1qlYmL5DcKMNYuxP8POoFrggPTxaKOgse451NblJOjSx0t8JygrChgecr
	A4qQf1i8V9ehndIK+gkftsMqTf3rxvd2PXbEW/GxH/PLzbwyxkfYAs3deiAzif7dssEdOqVr9XE
	ftZgJFwa6lexlDIj7f5hQqHNjb8/1UvIiZj6/Qa/BakRjwvauGsu+oqK2RDHlfEHGuSCa6Lx+aV
	UDErUIEJ69nKjIQP0Y2rwbJSNvtQExtr7v5FQKuDH1zrFi7bABAZc+Ev6l7r44dI2mseQx4tG+j
	TGoPHkTaIpAkUME6SntzvYrAscYvPBe8s3O1PTTIpd2xqODDGq7Cupcjqdl6wzBXU68BMBivDzD
	uaL48OqZmKaStmMZ4uMeWw3GndIAj1+kokwFoIXMJJ+FEIcG/oWSkS
X-Received: by 2002:a05:6512:688b:20b0:5c0:a4e:5cf5 with SMTP id
 2adb3069b0e04-5c1bc7d10c3mr3567435e87.26.1795620943192; Wed, 25 Nov 2026
 07:35:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
In-Reply-To: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 21:05:30 +0530
X-Gm-Features: Aa3M54oJBm-fP-yPqacXbdiaITq6or3sIYt9H8e38Vy7GvqmmY_G97lMunRikYo
Message-ID: <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap
 only once
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073549_383186_2A15F868 
X-CRM114-Status: GOOD (  19.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTE6MzTigK9BTSBHVU8gUmVuIChYdWFuVGllKSA8Z3Vv
cmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKSBtYXkgcnVu
IG1vcmUgdGhhbiBvbmNlIG9uIHRoZSBzYW1lIENQVS4gIFRoZQo+IHBlci1DUFUgZnJlZV9iaXRt
YXAgb25seSBuZWVkcyB0byBiZSBpbml0aWFsaXplZCBvbmNlLCBmcm9tIHRoZSBIR0VJRQo+IHdp
ZHRoIGRpc2NvdmVyZWQgb24gdGhhdCBDUFUuICBQZXJmb3JtIHRoZSBIR0VJRSBwcm9iZSBhbmQg
Yml0bWFwCj4gc2V0dXAgb25seSBvbiB0aGUgZmlyc3QgY2FsbCwgYW5kIHNldCBmcmVlX2JpdG1h
cF9pbml0aWFsaXplZCBhZnRlcgo+IHRoZSBiaXRtYXAgaGFzIGJlZW4gcG9wdWxhdGVkLgoKVGhl
IHBlci1DUFUgZnJlZV9iaXRtYXAgZm9yIEhHRUkgbGluZXMgb25seSBvbmUgdW5zaWduZWQgbG9u
ZyBzbwpJIGFtIG5vdCBzdXJlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gc2F2ZSBieSBza2lwcGlu
ZyBvbmUgdW5zaWduZWQgbG9uZy4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBH
VU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL2FpYS5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5j
IGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRleCBiM2I0NjZlNGRiMzMuLmE2NTc0ODMyMWY3
ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL2FpYS5jCj4gQEAgLTYxMCw2ICs2MTAsOSBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxl
KHZvaWQpCj4gICAgICAgICBsYyA9IChnYykgPyB0aGlzX2NwdV9wdHIoZ2MtPmxvY2FsKSA6IE5V
TEw7Cj4gICAgICAgICBoZ2N0cmwgPSB0aGlzX2NwdV9wdHIoJmFpYV9oZ2VpKTsKPgo+ICsgICAg
ICAgaWYgKGhnY3RybC0+ZnJlZV9iaXRtYXBfaW5pdGlhbGl6ZWQpCj4gKyAgICAgICAgICAgICAg
IGdvdG8gc2tpcF9oZ2N0cmxfaW5pdDsKPiArCj4gICAgICAgICAvKiBGaWd1cmUtb3V0IG51bWJl
ciBvZiBiaXRzIGluIEhHRUlFICovCj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHRUlFLCAtMVVM
KTsKPiAgICAgICAgIGhnY3RybC0+bnJfaGdlaSA9IGZsc19sb25nKGNzcl9yZWFkKENTUl9IR0VJ
RSkpOwo+IEBAIC02MzQsMTIgKzYzNywxMSBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxlKHZv
aWQpCj4gICAgICAgICB9IHdoaWxlICghYXRvbWljX3RyeV9jbXB4Y2hnKCZrdm1fcmlzY3ZfYWlh
X25yX2hnZWksICZhaWFfbnJfaGdlaSwgaGdjdHJsLT5ucl9oZ2VpKSk7Cj4KPiAgICAgICAgIHJh
d19zcGluX2xvY2tfaXJxc2F2ZSgmaGdjdHJsLT5sb2NrLCBmbGFncyk7Cj4gLSAgICAgICBpZiAo
IWhnY3RybC0+ZnJlZV9iaXRtYXBfaW5pdGlhbGl6ZWQpIHsKPiAtICAgICAgICAgICAgICAgaGdj
dHJsLT5mcmVlX2JpdG1hcCA9IChoZ2N0cmwtPm5yX2hnZWkpID8gR0VOTUFTS19VTEwoaGdjdHJs
LT5ucl9oZ2VpLCAxKSA6IDA7Cj4gLSAgICAgICAgICAgICAgIGhnY3RybC0+ZnJlZV9iaXRtYXBf
aW5pdGlhbGl6ZWQgPSB0cnVlOwo+IC0gICAgICAgfQo+ICsgICAgICAgaGdjdHJsLT5mcmVlX2Jp
dG1hcCA9IChoZ2N0cmwtPm5yX2hnZWkpID8gR0VOTUFTS19VTEwoaGdjdHJsLT5ucl9oZ2VpLCAx
KSA6IDA7Cj4gKyAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwX2luaXRpYWxpemVkID0gdHJ1ZTsK
PiAgICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZoZ2N0cmwtPmxvY2ssIGZsYWdz
KTsKPgo+ICtza2lwX2hnY3RybF9pbml0Ogo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IVklDVEws
IGFpYV9odmljdGxfdmFsdWUoZmFsc2UpKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfSFZJUFJJ
TzEsIDB4MCk7Cj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hWSVBSSU8yLCAweDApOwo+Cj4gLS0t
Cj4gYmFzZS1jb21taXQ6IDkzZjUxNTc5ZTdkZjI0ODc4MDIxNDA5NDQxOGYyMDUyNTMzODNjYzUK
PiBjaGFuZ2UtaWQ6IDIwMjYwOTI0LWZyZWVfYml0bWFwX2luaXRpYWxpemVkLWFiZGM5NGE1Mjhm
Ygo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJu
ZWwub3JnPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=

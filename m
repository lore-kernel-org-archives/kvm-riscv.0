Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B8FF494B
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ex+WDIi+miKwYhRfYsWl94XjzqQBKFb2mE1qIopL0A=; b=UUNE+XDzqqf2ee
	hNZqzvAYtLiHo1dpOIRY7g51Djxf/N0e7P8rAgiEmMM9yd5Sg2D2bnUEKNPo0mZ1dBcJW91BXb8fe
	3eM8tjthAcrjGS+WSOKxTQ/m+6r6wqEJgsMMBNsWgYIe3dDavy2V8WIbRMWXhn5Uzd5l/3gE7ldj5
	FnRjbwFsu9MftF+3/ibVySGkxwjVXuWVAa7XUJd0a+tLC1+X24cyUlQ5w1TK3wtU60waCWwZLEUhl
	Hc82AP+IEDWzOReLiyYosNnr5YG4vEQCHq9e3xA7h+XYzD3OyGovKcNaFzdP/LuLnJRSHB73p/Znl
	kd3denSzwEb+brTvgp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764i-0000000AgQp-3Iru;
	Mon, 30 Mar 2026 06:26:12 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764g-0000000AgOS-0iIj
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:26:11 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-67c1e0718f1so2559604eaf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 29 Mar 2026 23:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774851969; cv=none;
        d=google.com; s=arc-20240605;
        b=aXT+ClIngNwLFm9U1nrpu4ge2mp+ETe8ZlcjyqMIH8m8aGJd8DkNBpoRpMR4yNk4jZ
         QFyrK+/7LAIm2ObrCqaa/RN88f5QEnWJ5f1RJNMse810ugGhWfSbYeDMKh403nAmtU0m
         PV2BeSPM2Zt/1lKw9jU/kOjX8pWVsqIcwyBpLFGrL66O9ipvGxxr0KHCuyhvg5gZFIJK
         t8hQg8bnJsW5WiaeHSoivHSOBDkQ1sPu6GIx3WNB0Hsznjrv3waDC5NakdpXripvt2tr
         DQpQqI8AQfgdftyZHqHVmB4C/Ae5cXoDGEUcpLOiR11FSmhm2OO8BFE/2OGuWccV7/AV
         V8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        fh=sSZGMIu0GAzT5Wjru6NibdolIwCtSbeoxDVzzQT79Ds=;
        b=YqlHFtCkjRDPitS6BVYJYUmMuzi0Aus4MD5c8YB0iyVB6KNwPoTu0+ILFze9AqRR0s
         R+/2hNtXvr5hBvjStj5H7E++2fFTEnuqD+aosFuNh/PSTFHnJkVLAuavf/4eH8vEFzHp
         2dbrDs6OlYxzCT4kWsCHwqOY3CFXGOlmgqWE/46YMzYa0bgbzCdDpYoU2TK1LeuMB3Wy
         zHMxKfng8+eijDkj3ABIiooDAL4bB2hoso1ypyNKU3GXjv+yS7lfz41FvOcUpAuqhzcR
         6WYjpVRqSUq/A75aBV7CAOqCk9rFvf18JROnZzT928ELZSIq8Zc1cqrcTO1WLgnxYlry
         So7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774851969; x=1775456769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        b=kL/x2r5EaWwBIIn4ybtY2gDuBWRftUJEZsVvS/HfbkD2Aos3SaSRbBYqifu/x4MRxP
         Q9mSqshla5fFLULMSV4CIhvedc58bVIwZ/UyN4rwFteAVoqDkpJM39ckXG9OTenBBHv6
         DRXqdfUzJJdoUbr3ZzRPMrq9eQ2GgbMiu3Daz/ppYBIpaaUTRLwJsbhzP9/Iu49FG/RP
         0HLbS0g+ENx11g1bKqnP8Jkny9v55kebXsZuLYAKUnA6h0zoEpp0dveKBDk6gzs4rV5d
         PgNFyfQzfCxJY+9p04jltrakvjU/9B9ZlUncPEko9Ve0dXt74yjEyuIHWIEtNndpQHtT
         GRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851969; x=1775456769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        b=dVppAKVDrk/RWw2dQ3KjxUJfMlx2YYzfrzPtrKV3qmvCz71sHFEZMcfdmOmt4OpWnt
         97EkrcFR3s+B225675OTnq1NkaMdwKuChzxsGebWHqpIb5Yb/p02GKyum7nGpXEIvcsM
         sYwIs5DzINW2ROCeHHGLtpiZedRG3SHjXOxpakXrA/rD7Aqe6O/8qAvC/myi92eC5ajq
         kqRQG54fZS2+8XEeuoOw8Sa8WSoXe44xLY+IjjSE1JnV14XpyyFc4Qhyzf2HsT2EP6vq
         mHlHEEpfYpTu1KlW8aTjmUOzxnKTSSfyI76Et7kUSe2aS1axzwxtSALzdlDjxNYDj8e9
         5fqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPwPrKapQnd2HcusKHVNNQN7zW4+Gq0290kA0f6Lcl6LPWW4e9TgCZLRzTbOgpZPVWiQxKua5cbHg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMBTyB+zsktIGGgtfS10of/vr/lNwOhOb32u5uVxR9tk+O/8EB
	HnPUlT4FVL9FWmUc7H1EquOcYAZjjbImfNfrT9qVQRyDEgS3okuDcLu5EDoO23iFvO+cPtRwiqd
	li/fZXNlNJBnUxfchcLDXSLLsKRqCYpTpPlNACdtBGw==
X-Gm-Gg: ATEYQzxB1CZEOQ9laW6aRi0DPAWdZyDCRQ7P89j3rDuvy9XgB6HcycSx0jEGIWbGfHS
	rF7LOEuu0hWyvn4n52Q2CmBiwwjORekx1hdeMFd+U5HO9IZLGgIQYFSgAzGHFSAMqjygtjo+dEC
	NrLUmbjhC/BVcxRVQnhr88Z60j89PdmzjGhzzWXuS3/Mh9EGsviXOclPcPo/yKY0DQTU1Cw+iTZ
	qMO6dCO/cwLllMHN8zesRxqgR63/9LR9Hvt2v71LEusqNeSMjNt4UxGkA/nu69buMAxPoNnsAn0
	6vDMUe4YNUuEEpoD6TbkMymcaSYzN3pb9Uw6YqKULE1QokQKoQcK+/y2BNoZ7TsWlNZFoz8IMAS
	WrTzBeYgk8TQIgGfWod98AKUyfQ==
X-Received: by 2002:a05:6820:4b8b:b0:67e:ca3:9c25 with SMTP id
 006d021491bc7-67e1863e4e3mr5724052eaf.28.1774851968771; Sun, 29 Mar 2026
 23:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn> <20260316141836922ffC0zmiE01ptC2jpXl4zJ@zte.com.cn>
In-Reply-To: <20260316141836922ffC0zmiE01ptC2jpXl4zJ@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 11:55:56 +0530
X-Gm-Features: AQROBzBDFmkMIaqvBMfy22hBMT2RUnYhvKcW62n6PtbYmFj9Ey95kgwKiNKUHAQ
Message-ID: <CAAhSdy0KTUjSbkpW=X_hbfw2qtEhWEVSr2i85ixBw4hzxuQsxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: KVM: Allow splitting huge pages to
 arbitrary level
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232610_230079_61038FCB 
X-CRM114-Status: GOOD (  25.23  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NDnigK9BTSA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgZnVuY3Rpb24ga3ZtX3Jpc2N2X2dz
dGFnZV9zcGxpdF9odWdlKCkuCj4gSXQgc3BsaXRzIHRoZSBodWdlIHBhZ2UgY292ZXJpbmcgYSBn
aXZlbiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIGRvd24KPiB0byBhIHNwZWNpZmllZCB0YXJnZXQg
bGV2ZWwgKGUuZy4sIGZyb20gMUcgdG8gMk0gb3IgNEspLiBUaGUgY2FsbGVyCj4gcHJvdmlkZXMg
YSBtZW1vcnkgY2FjaGUgZm9yIGFsbG9jYXRpbmcgYW55IGludGVybWVkaWF0ZSBwYWdlIHRhYmxl
cwo+IGFuZCBtYXkgcmVxdWVzdCBhIFRMQiBmbHVzaCBhZnRlciB0aGUgc3BsaXQuCj4KPiBUaGlz
IGZ1bmN0aW9uYWxpdHkgd2lsbCBiZSB1c2VkIGJ5IHN1YnNlcXVlbnQgcGF0Y2hlcyB0byBzcGxp
dCBodWdlCj4gcGFnZXMgYmVmb3JlIGhhbmRsaW5nIHRoZSB3cml0ZS1wcm90ZWN0aW9uIGZhdWx0
LCBvciBmb3Igb3RoZXIgb3BlcmF0aW9ucwo+IHRoYXQgcmVxdWlyZSBwYWdlLWxldmVsIGdyYW51
bGFyaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0
ZS5jb20uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwg
IDQgKysKPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA2OSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gaW5kZXggNTk1ZTIxODMxNzNl
Li4zNzM3NDhjNjc0NWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
Z3N0YWdlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+IEBA
IC01Myw2ICs1MywxMCBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZShzdHJ1Y3Qga3Zt
X2dzdGFnZSAqZ3N0YWdlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcGFn
ZV9yZG9ubHksIGJvb2wgcGFnZV9leGVjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBrdm1fZ3N0YWdlX21hcHBpbmcgKm91dF9tYXApOwo+Cj4gK2ludCBrdm1fcmlzY3Zf
Z3N0YWdlX3NwbGl0X2h1Z2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgKnBjYWNo
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBhZGRyLCB1MzIgdGFy
Z2V0X2xldmVsLCBib29sIGZsdXNoKTsKPiArCj4gIGVudW0ga3ZtX3Jpc2N2X2dzdGFnZV9vcCB7
Cj4gICAgICAgICBHU1RBR0VfT1BfTk9QID0gMCwgICAgICAvKiBOb3RoaW5nICovCj4gICAgICAg
ICBHU1RBR0VfT1BfQ0xFQVIsICAgICAgICAvKiBDbGVhci9Vbm1hcCAqLwo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5k
ZXggZDIwMDFkNTA4MDQ2Li41MzU2YWJiMTg5MzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0yMDksNiAr
MjA5LDc1IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX21hcF9wYWdlKHN0cnVjdCBrdm1fZ3N0YWdl
ICpnc3RhZ2UsCj4gICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlKGdzdGFn
ZSwgcGNhY2hlLCBvdXRfbWFwKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBtYWtlX2NoaWxkX3B0ZSh1bnNpZ25lZCBsb25nIGh1Z2VfcHRlLCBpbnQgaW5kZXgsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY2hp
bGRfcGFnZV9zaXplKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGNoaWxkX3B0ZSA9IGh1
Z2VfcHRlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBjaGlsZF9wZm5fb2Zmc2V0Owo+ICsKPiAr
ICAgICAgIC8qCj4gKyAgICAgICAgKiBUaGUgY2hpbGRfcHRlIGFscmVhZHkgaGFzIHRoZSBiYXNl
IGFkZHJlc3Mgb2YgdGhlIGh1Z2UgcGFnZSBiZWluZwo+ICsgICAgICAgICogc3BsaXQuIFNvIHdl
IGp1c3QgaGF2ZSB0byBPUiBpbiB0aGUgb2Zmc2V0IHRvIHRoZSBwYWdlIGF0IHRoZSBuZXh0Cj4g
KyAgICAgICAgKiBsb3dlciBsZXZlbCBmb3IgdGhlIGdpdmVuIGluZGV4Lgo+ICsgICAgICAgICov
Cj4gKyAgICAgICBjaGlsZF9wZm5fb2Zmc2V0ID0gaW5kZXggKiAoY2hpbGRfcGFnZV9zaXplIC8g
UEFHRV9TSVpFKTsKPiArICAgICAgIGNoaWxkX3B0ZSB8PSBwdGVfdmFsKHBmbl9wdGUoY2hpbGRf
cGZuX29mZnNldCwgX19wZ3Byb3QoMCkpKTsKPiArCj4gKyAgICAgICByZXR1cm4gY2hpbGRfcHRl
Owo+ICt9Cj4gKwo+ICtpbnQga3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9odWdlKHN0cnVjdCBrdm1f
Z3N0YWdlICpnc3RhZ2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
a3ZtX21tdV9tZW1vcnlfY2FjaGUgKnBjYWNoZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdwYV90IGFkZHIsIHUzMiB0YXJnZXRfbGV2ZWwsIGJvb2wgZmx1c2gpCj4gK3sKPiAr
ICAgICAgIHUzMiBjdXJyZW50X2xldmVsID0ga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIC0g
MTsKPiArICAgICAgIHB0ZV90ICpuZXh0X3B0ZXAgPSAocHRlX3QgKilnc3RhZ2UtPnBnZDsKPiAr
ICAgICAgIHB0ZV90ICpwdGVwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodWdlX3B0ZSwgY2hp
bGRfcHRlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBjaGlsZF9wYWdlX3NpemU7Cj4gKyAgICAg
ICBpbnQgaSwgcmV0OwoKRGVjbGFyZSBsb2NhbCB2YXJpYWJsZXMgaW4gaW52ZXJ0ZWQgcHlyYW1p
ZCBmYXNoaW9uLgoKPiArCj4gKyAgICAgICB3aGlsZShjdXJyZW50X2xldmVsID4gdGFyZ2V0X2xl
dmVsKSB7Cj4gKyAgICAgICAgICAgICAgIHB0ZXAgPSAocHRlX3QgKikmbmV4dF9wdGVwW2dzdGFn
ZV9wdGVfaW5kZXgoYWRkciwgY3VycmVudF9sZXZlbCldOwo+ICsKPiArICAgICAgICAgICAgICAg
aWYgKCFwdGVfdmFsKHB0ZXBfZ2V0KHB0ZXApKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghZ3N0YWdlX3B0ZV9sZWFmKHB0ZXApKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbmV4dF9wdGVwID0gKHB0ZV90ICopZ3N0YWdlX3B0
ZV9wYWdlX3ZhZGRyKHB0ZXBfZ2V0KHB0ZXApKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
dXJyZW50X2xldmVsLS07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKyAg
ICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGh1Z2VfcHRlID0gcHRlX3ZhbChw
dGVwX2dldChwdGVwKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbGV2ZWxf
dG9fcGFnZV9zaXplKGN1cnJlbnRfbGV2ZWwgLSAxLCAmY2hpbGRfcGFnZV9zaXplKTsKPiArICAg
ICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFwY2FjaGUpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CgpUaGlzIGNoZWNrcyBuZWVkcyB0byBiZSBvdXRzaWRlIHdo
aWxlLWxvb3AuCgo+ICsgICAgICAgICAgICAgICBuZXh0X3B0ZXAgPSBrdm1fbW11X21lbW9yeV9j
YWNoZV9hbGxvYyhwY2FjaGUpOwo+ICsgICAgICAgICAgICAgICBpZiAoIW5leHRfcHRlcCkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBQVFJTX1BFUl9QVEU7IGkrKykgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNoaWxkX3B0ZSA9IG1ha2VfY2hpbGRfcHRlKGh1Z2VfcHRlLCBpLCBjaGlsZF9w
YWdlX3NpemUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNldF9wdGUoKHB0ZV90ICopJm5l
eHRfcHRlcFtpXSwgX19wdGUoY2hpbGRfcHRlKSk7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4g
KyAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgcGZuX3B0ZShQRk5fRE9XTihfX3BhKG5leHRf
cHRlcCkpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19wZ3Byb3QoX1BBR0Vf
VEFCTEUpKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoZmx1c2gpCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZ3N0YWdlX3RsYl9mbHVzaChnc3RhZ2UsIGN1cnJlbnRfbGV2ZWwsIGFkZHIp
Owo+ICsKPiArICAgICAgICAgICAgICAgY3VycmVudF9sZXZlbC0tOwo+ICsgICAgICAgfQo+ICsK
PiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfb3Bf
cHRlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IGFkZHIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwdGVfdCAqcHRlcCwgdTMyIHB0ZXBfbGV2ZWwsIGVudW0ga3ZtX3Jp
c2N2X2dzdGFnZV9vcCBvcCkKPiAgewo+IC0tCj4gMi4yNy4wCgpUaGUga3ZtX3Jpc2N2X2dzdGFn
ZV9zcGxpdF9odWdlKCkgZnVuY3Rpb24gaW50cm9kdWNlZCBoZXJlCmlzIG9ubHkgdXNlZCBpbiBQ
QVRDSDMgc28gYmV0dGVyIHNxYXNoIHRoaXMgcGF0Y2ggaW50byBQQVRDSDMuCgpSZWdhcmRzLApB
bnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28095D58E7E
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyJu6pMtSidrCPsM9UVtZZNAro/3DUvyTCh6Wt/HJPQ=; b=gNpX7XIVI6IhaW
	c6xbEuSONEQ5Qx9dAsCVNbUuIvazV+NbN24Ey4NWIeT5mw2E8vmIcYnVaukJ4sobzJRFiQOafjx2K
	AXqn4HkDckVeOandMVAahqQA24cSDhpUqEf037GEecH2+izWt+J4FEP4i+5NlO6bRVUVDldIMXYki
	qOZ4GGUNfs+lsR3Bq+orZFw8CBTymXaY0gc9pi/kiufZhnvlhZo7b22eW7xVux/v5R6FrV2dCXG/B
	ZZDgPhaHmEns3Vstn33GXAtloM6B3ZkVSxryg/xhy9vxeX5LIP3uOvqKh1afZJzVuyBFBC5zJV1Ee
	5MZ08GqEFkHicqIZtYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyly-0000000CWju-3PLx;
	Mon, 02 Mar 2026 08:37:02 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwylv-0000000CWiQ-3Rg0
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 08:37:00 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-66f747175d8so2334556eaf.0
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 00:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772440618; cv=none;
        d=google.com; s=arc-20240605;
        b=UBFN2Ci79ZjsfZEtVw8CltlXRw9nPjZXn9l2qRLdzXyNe1rU0/mFB7WE0Pke+ptIMp
         uUolxJV3HGwGQWBCzLlhnY8e0bhqBbKYfdhhkh7IPg0aIrRtqZLgq+n2owP/kWh8wu0M
         IQ2KjJz7J3mUpMVfIUS7pnNp/LgciHhdi5Vk1laipwoLp03uJ0B4gt7iu6rXHyqIGBFq
         A3QSYFx7NfJ9+z9JC1SXUi4gorkGScVw5hqpa7jJ5nDsiQ3sMVO6oDyugjtnKzyFTclb
         7Dp84FRLq5XfK2NZZK8jsfNk2sFr1ixeNrQGMvjOlo6ioG2qOPRi7dREf9MDy1fSoGYl
         EkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        fh=ieX91ipg27LKZIfOp+WC6zuaW6Bh01fEm+xH3hW+z3Y=;
        b=c3uYO8iawDcjLF961YJqHZjWxG4ucYYR3y9RCLizWY6oNd6qg0pIC21QjGIoWjSrKU
         eXJxhbMUfUT5x8uBk+Ur1NMxVMez9vaFkhUgZkmHMuE3W67Ivul6i1hQJAk/cVTCSqOh
         WHjZeUFQ8TrubbiArE25PlH5GcJd46gUSaK2LLEhVo1q4Xnjyc5ofny1z0FTJXXGgQIg
         6stNR7yRMLc0MOo9w+KDAKjca1OzQNcnQyy6lp+2HQUZFQrMqF8OOJM7SVqdkH+22TUp
         H5haSaL4yXvPAgbw76RE49ftlAP+TfS1zjVgcJ309SUhQGknfya0UXIYypPOwbNUyJpq
         joOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772440618; x=1773045418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        b=w7fsN/bfnSUsrQfwO4NvM9F9J4pqUJ+llcSm3pD+qqhVGej8zCKGEoEVJoGoiZ32aF
         W+sv/QojMAybSbXD8fDo64wvnSmFxgYpFroSxF8ESb1GzCGZfyX1VygZR1KXOJ86RtZ/
         Ssx0StJsrkkFHUNbkpxnv/ilDy9FnA9F0y/5vJUCZeHm2N81wey2udPTTHv/sNn0K4su
         GDrjUE6r2qVfb6HY4El6rDsvwgLMhh0H3zrOE8MxbGfFu3N00zbAmSQ8N/iztmSSh5q6
         SqzcrqZOJ2CzIkIfhcwswo13YOX7d124e1CQitX0r7j9NxrC9jJbVkv9xNga/gtlUcoN
         kt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440618; x=1773045418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        b=ladHdwdeWI2M0Gp1InacGpW3CxlCVKN8F2Drl3eVKztlJyJTYovEw69Tel7HGpFrvy
         Aw+2pcrukmfsZWw6DFpaUp5Kx5wEz1ouCVgqx4snvpm0RG1v+QssfGJGaWDedh1TWGAI
         sEYFT1CJghL+99eQuI7Wk5xVTd3TS3UA1ezS8C4/OncMVTyZ9xDvwjscQ50a+fhZLqnP
         S9ywk3bvOtK0MreV76j54GA0va2cOi/6r4p4jK2E49skhIA4fdy6oUblSq4NKKxsYjpy
         6xHEGdiuKUP8tfa57jvth/z3Jjm501SXDZGxqxnL5h1AArY12I8GxNCos6OPucJWkCjK
         4Lww==
X-Forwarded-Encrypted: i=1; AJvYcCUHgQ5S2ehJ7+JXmuybf7p/bOtEFK0QDsGiHe75nEPPXsjHE+63GXJSZTWtFeBQ9WaD8yjQe/FiFRk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX0LcHWh1b7g5a34M5QsPk/D4s5XNdstMrOmT9pWVic2K6LblQ
	HiipJS8ddU0K//FefuripaCuVjOe0JIJ5IDCRVpPJcLW5udhnMf45rLN2RKAIIVq2T85pGn03+n
	/lt+X1R+3mYSvOaF4XjWewycyqUPFzO24cgvtuHfPIQ==
X-Gm-Gg: ATEYQzyrC7J1uflmWqcEtstMWa/GM3cjgwlE/BsROP7tbUb6xjGdXKVyJsXNG9ithA6
	GsG0aX1qDDnoNG/wU4DzY6hTqavbN0QwDYzMijf6yuHtl/ZtsYmZnFSpjY8q3xMmooliEXPZB8K
	gcZYpzaklOunQ2/J/klsiwGN3EeQ3iuwl8kfi7WoEuvMvvpfsg76zWds5OSgs+44csgn/M/ca1q
	s/Qnp2f3ehVyusVEnb6Su94z5PA8oeY7Wgw7hpeA3nAte8vYNjSHu0hTzniVZal8P291DZOEJNM
	GPqep8w7XIJLzVnnfzpho7sEXhwCwtE6Tsfeqv/25V1+VlXbqcum2Blamg9H2rrb2cJdpGPMfzt
	iZ6iIOgAZdf1V4MhMIXFfrCahsrU=
X-Received: by 2002:a05:6820:4810:b0:679:8b1d:ba0f with SMTP id
 006d021491bc7-679faeff7c6mr5220357eaf.39.1772440618592; Mon, 02 Mar 2026
 00:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 14:06:46 +0530
X-Gm-Features: AaiRm51GI-DugvCRdiijwtodWGn36vtplbYEJJN6taqR6JPTEeVPaXB6mjwDWVE
Message-ID: <CAAhSdy1Ha31-bYFs2DknN00i_boP_2hyaXyqf2UQ+YypC3pefg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_003659_943872_39E7492C 
X-CRM114-Status: GOOD (  19.99  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjoyMeKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKSBh
c3N1bWVzIHRoYXQgdGhlIHBlci12Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGJlZW4gaW5pdGlhbGl6
ZWQgb25jZSBBSUEgaXMgcmVwb3J0ZWQgYXMgYXZhaWxhYmxlIGFuZCBpbml0aWFsaXplZCBhdAo+
IHRoZSBWTSBsZXZlbC4gVGhpcyBhc3N1bXB0aW9uIGRvZXMgbm90IGFsd2F5cyBob2xkLgo+Cj4g
VW5kZXIgZnV6emVkIGlvY3RsIHNlcXVlbmNlcywgYSBndWVzdCBtYXkgYWNjZXNzIHRoZSBJTVNJ
QyBUT1BFSSBDU1IKPiBiZWZvcmUgdGhlIHZDUFUgSU1TSUMgc3RhdGUgaXMgc2V0IHVwLiBJbiB0
aGlzIGNhc2UsCj4gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZSBpcyBzdGlsbCBO
VUxMLCBhbmQgdGhlIFRPUEVJIFJNVyBwYXRoCj4gZGVyZWZlcmVuY2VzIGl0IHVuY29uZGl0aW9u
YWxseSwgbGVhZGluZyB0byBhIGhvc3Qga2VybmVsIGNyYXNoLgo+Cj4gVGhlIGNyYXNoIG1hbmlm
ZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZp
cnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAwZQo+ICAgLi4uCj4gICBrdm1fcmlzY3Zf
dmNwdV9haWFfaW1zaWNfcm13IGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jOjkwOQo+ICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3Jtd190b3BlaSBhcmNoL3Jpc2N2L2t2bS9haWEuYzoyMzEKPiAgIGNz
cl9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjIwOAo+ICAgc3lzdGVtX29wY29kZV9p
bnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjI4MQo+ICAga3ZtX3Jpc2N2X3ZjcHVfdmly
dHVhbF9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjM1NQo+ICAga3ZtX3Jpc2N2X3Zj
cHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyMzAKPiAgIGt2bV9hcmNoX3ZjcHVf
aW9jdGxfcnVuIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzoxMDA4Cj4gICAuLi4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgY2hlY2tpbmcgd2hldGhlciB0aGUgdkNQVSBJTVNJQyBzdGF0ZSBoYXMg
YmVlbgo+IGluaXRpYWxpemVkIGJlZm9yZSBoYW5kbGluZyBUT1BFSSBDU1IgYWNjZXNzZXMuIElm
IG5vdCwgZm9yd2FyZCB0aGUgQ1NSCj4gZW11bGF0aW9uIHRvIHVzZXIgc3BhY2UuCj4KPiBGaXhl
czogZGI4YjdlOTdkNjEzNyAoIlJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0
aW9uIG9mIEFJQSBJTVNJQyIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIw
MjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRA
Z21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4ZXMgZm9yIExpbnV4LTcuMC1yY1gKClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gVjEgLT4gVjI6IE1vdmVkIGltc2ljX3N0YXRlIE5VTEwgY2hl
Y2sgaW50byBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcm13KCkuCj4gICAgICAgICAgIFVwZGF0
ZWQgRml4ZXMgdGFnIHRvIGRiOGI3ZTk3ZDYxMzcuCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4gaW5kZXggZmRhMDM0NmYwZWExZi4uNjA5MTdmNDc4OWQ4NCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4gQEAgLTg5Miw2ICs4OTIsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19ybXcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGlzZWwsCj4g
ICAgICAgICBpbnQgciwgcmMgPSBLVk1fSU5TTl9DT05USU5VRV9ORVhUX1NFUEM7Cj4gICAgICAg
ICBzdHJ1Y3QgaW1zaWMgKmltc2ljID0gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0
ZTsKPgo+ICsgICAgICAgLyogSWYgSU1TSUMgdkNQVSBzdGF0ZSBub3QgaW5pdGlhbGl6ZWQgdGhl
biBmb3J3YXJkIHRvIHVzZXIgc3BhY2UgKi8KPiArICAgICAgIGlmICghaW1zaWMpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBLVk1fSU5TTl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4gKwo+ICAgICAg
ICAgaWYgKGlzZWwgPT0gS1ZNX1JJU0NWX0FJQV9JTVNJQ19UT1BFSSkgewo+ICAgICAgICAgICAg
ICAgICAvKiBSZWFkIHBlbmRpbmcgYW5kIGVuYWJsZWQgaW50ZXJydXB0IHdpdGggaGlnaGVzdCBw
cmlvcml0eSAqLwo+ICAgICAgICAgICAgICAgICB0b3BlaSA9IGltc2ljX21yaWZfdG9wZWkoaW1z
aWMtPnN3ZmlsZSwgaW1zaWMtPm5yX2VpeCwKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

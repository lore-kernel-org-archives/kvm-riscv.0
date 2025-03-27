Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E3C3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HbJa6DliJja4JfHZVvrXfeheXJDlwJu6Dn0gtOb4vnY=; b=dWWE5vkTfsgdD6aBtWOZqdQgWK
	tXrawx2sJnOTSmvVfdzkkcFqGY1P383Eh5LHpklIf+1FxrfralfQGvoz6UFpPNtG80s0tTPNYKHTc
	IcrXb0VoBKSEUz7ST48kqgfKWv5zjfuaSZ68tjkJp16nPT5ButJBut4nfbTJIbJo5qyn3CyptC/x/
	9rRe4ZPfYoJD41y6Ylr6UbRhRDlQl42uuWJm7I86eIVI1dIv+sP46mtJIIksitfpyMCi3XZvLLNrT
	74bM89uc8k6wmcXashEqQHXHrLfb+9wh/NfIfIhx59Gfoq8jEoSY0WpVPmON85LEWJ1izmx1wPweN
	lMSHKImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmdy-0000000Axxj-1ykB;
	Thu, 27 Mar 2025 12:47:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmdw-0000000Axx5-0Qy0;
	Thu, 27 Mar 2025 12:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94E5444B4F;
	Thu, 27 Mar 2025 12:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB168C4CEF1;
	Thu, 27 Mar 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743079650;
	bh=tWRtgxQFfYLGIe+M3bP4npfrIUeWm1/2DsIIszdvZ1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=ry+3lJ4jOXxi94y5mI1NbXnalzo+G/pnZhSjrID66dTcLVpvSN5jxYLjoTFSpm8t2
	 RVmKewcN7zdZNd9LKSrvUmI7Bitb6RSvE7xtBxsyaXOJotG+IzA+4cSiX8s5XJcd4a
	 Gflk19wroRN6hPkMWa+MtGfvaJAZL2ppLItlCErXCvjy0HVn2BGenZE8FkLMdyZJYX
	 btnwncSVrJy5++ND3g+6x3gmSehP4lsafQ7UigXG8+8I+Idsw/U+sgz5n2nwr8zWSp
	 H++QkUGRCbXL4b+bUxPVKQyPP9wfeJA4D52pvQD5Qmb8PrgNvDFT5Gco7rpxg0Rv5D
	 +Xv0BqRwjjbZg==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf680d351so11855505e9.0;
        Thu, 27 Mar 2025 05:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUigzAUC9JP9008qeguM/UBhEib1kMhnhTSZSzWlX25BVh/MhtmK1tEoRYOXghyqqbFZNY9oo96yxRyFg==@lists.infradead.org, AJvYcCV74/n3AdnSn6Gxt35wcEdMbBd+LEeyfGb2nWEx8HBFqaTAcKEOgO+E1RxJPhbXJ1aFbg/5FZx5zio=@lists.infradead.org, AJvYcCWu8GdBcL0Ff9wUwmv/5/1mveCL1QA51+rcDhVvlOXeOjFV6krvdRDGIg4sigjVXoM2aARSwDwuNGrXLPg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK3SVIetyKpknFU+pCRu4UrAGdE6m7iwhFkKjyPa1QwXztO46g
	UQ0FYd6HIsiBCP34r+Q8f+TNKPldb1bLFPOQuDi1481vmp9DmDjx6nPZDr1K84KTOziv0ZNyuXo
	/JxMUZeiwRGbP3cp6yXHHP2igS3c=
X-Google-Smtp-Source: AGHT+IHmUYVhD/X+fFCk9mo6iUY3GGy6zSlwPlvt9V5E3bXgq4+AzDcNpwzxGBSsif+BeffRslEST7FtUwPlgXmmxiQ=
X-Received: by 2002:a5d:5f43:0:b0:391:65c:1b05 with SMTP id
 ffacd0b85a97d-39c099cd2bbmr115764f8f.11.1743079648810; Thu, 27 Mar 2025
 05:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-32-guoren@kernel.org>
 <4gph4xikdbg6loy2id72uyxgldsldecc7gquhymusl3vreiw3a@ephk5ahhrdw7>
In-Reply-To: <4gph4xikdbg6loy2id72uyxgldsldecc7gquhymusl3vreiw3a@ephk5ahhrdw7>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 27 Mar 2025 20:47:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSR+jh04BT7rCjALL6eWek=VWm7nFTW57vzwshkTbrtVg@mail.gmail.com>
X-Gm-Features: AQ5f1JoN57xvarY3Pp887PY64wPP4HS8fDT1YiKKfNiabWlzF5M2aRc4_YpAz7M
Message-ID: <CAJF2gTSR+jh04BT7rCjALL6eWek=VWm7nFTW57vzwshkTbrtVg@mail.gmail.com>
Subject: Re: [RFC PATCH V3 31/43] rv64ilp32_abi: maple_tree: Use BITS_PER_LONG
 instead of CONFIG_64BIT
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, guoren@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, torvalds@linux-foundation.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, 
	will@kernel.org, mark.rutland@arm.com, brauner@kernel.org, 
	akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, 
	unicorn_wang@outlook.com, inochiama@outlook.com, gaohan@iscas.ac.cn, 
	shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_054732_184820_11CE1E03 
X-CRM114-Status: GOOD (  26.05  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMzoxMOKAr0FNIExpYW0gUi4gSG93bGV0dCA8TGlhbS5I
b3dsZXR0QG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gKiBndW9yZW5Aa2VybmVsLm9yZyA8Z3VvcmVu
QGtlcm5lbC5vcmc+IFsyNTAzMjUgMDg6MjRdOgo+ID4gRnJvbTogIkd1byBSZW4gKEFsaWJhYmEg
REFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4KPiA+IFRoZSBNYXBsZSB0cmVl
IGFsZ29yaXRobSB1c2VzIHVsb25nIHR5cGUgZm9yIGVhY2ggZWxlbWVudC4gVGhlCj4gPiBudW1i
ZXIgb2Ygc2xvdHMgaXMgYmFzZWQgb24gQklUU19QRVJfTE9ORyBmb3IgUlY2NElMUDMyIEFCSSwg
c28KPiA+IHVzZSBCSVRTX1BFUl9MT05HIGluc3RlYWQgb2YgQ09ORklHXzY0QklULgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L21hcGxlX3RyZWUuaCB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tYXBsZV90cmVlLmggYi9pbmNsdWRlL2xpbnV4
L21hcGxlX3RyZWUuaAo+ID4gaW5kZXggY2JiY2QxOGQ0MTg2Li5mZjYyNjViNjQ2OGIgMTAwNjQ0
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21hcGxlX3RyZWUuaAo+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9tYXBsZV90cmVlLmgKPiA+IEBAIC0yNCw3ICsyNCw3IEBACj4gPiAgICoKPiA+ICAgKiBO
b2RlcyBpbiB0aGUgdHJlZSBwb2ludCB0byB0aGVpciBwYXJlbnQgdW5sZXNzIGJpdCAwIGlzIHNl
dC4KPiA+ICAgKi8KPiA+IC0jaWYgZGVmaW5lZChDT05GSUdfNjRCSVQpIHx8IGRlZmluZWQoQlVJ
TERfVkRTTzMyXzY0KQo+ID4gKyNpZiAoQklUU19QRVJfTE9ORyA9PSA2NCkgfHwgZGVmaW5lZChC
VUlMRF9WRFNPMzJfNjQpCj4KPiBUaGlzIHdpbGwgYnJlYWsgbXkgdXNlcnNwYWNlIHRlc3Rpbmcs
IGlmIHlvdSBkbyBub3QgdXBkYXRlIHRoZSB0ZXN0aW5nIGFzCj4gd2VsbC4gIFRoaXMgY2FuIGJl
IGZvdW5kIGluIHRvb2xzL3Rlc3RpbmcvcmFkaXgtdHJlZS4gIFBsZWFzZSBhbHNvIGxvb2sKPiBh
dCB0aGUgTWFrZWZpbGUgYXMgd2VsbCBzaW5jZSBpdCB3aWxsIGdlbmVyYXRlIGEgYnVpbGQgZmxh
ZyBmb3IgdGhlCj4gdXNlcnNwYWNlLgpJIHRoaW5rIHlvdSBhcmUgdGFsa2luZyBhYm91dCB0aGUg
Zm9sbG93aW5nOgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KLi4vc2hhcmVkL3NoYXJlZC5tazoKaWZuZGVmIExPTkdfQklUCkxPTkdf
QklUIDo9ICQoc2hlbGwgZ2V0Y29uZiBMT05HX0JJVCkKZW5kaWYKCmdlbmVyYXRlZC9iaXQtbGVu
Z3RoLmg6IEZPUkNFCiAgICAgICAgQG1rZGlyIC1wIGdlbmVyYXRlZAogICAgICAgIEBpZiAhIGdy
ZXAgLXF3cyBDT05GSUdfJChMT05HX0JJVClCSVQgZ2VuZXJhdGVkL2JpdC1sZW5ndGguaDsgdGhl
biAgIFwKICAgICAgICAgICAgICAgIGVjaG8gIkdlbmVyYXRpbmcgJEAiOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICBlY2hvICIjZGVmaW5l
IENPTkZJR18kKExPTkdfQklUKUJJVCAxIiA+ICRAOyAgICAgICAgICAgICAgICAgXAogICAgICAg
ICAgICAgICAgZWNobyAiI2RlZmluZSBDT05GSUdfUEhZU19BRERSX1RfJChMT05HX0JJVClCSVQg
MSIgPj4gJEA7ICAgIFwKICAgICAgICBmaQoKJCBncmVwIENPTkZJR182NEJJVCAqIC1yIC1BIDIK
Z2VuZXJhdGVkL2JpdC1sZW5ndGguaDojZGVmaW5lIENPTkZJR182NEJJVCAxCmdlbmVyYXRlZC9i
aXQtbGVuZ3RoLmgtI2RlZmluZSBDT05GSUdfUEhZU19BRERSX1RfNjRCSVQgMQotLQptYXBsZS5j
OiNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkKbWFwbGUuYy1zdGF0aWMgbm9pbmxpbmUgdm9pZCBf
X2luaXQgY2hlY2tfZXJhc2UyX3Rlc3RzZXQoc3RydWN0IG1hcGxlX3RyZWUgKm10LAptYXBsZS5j
LSAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nICpzZXQsIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKLS0KbWFwbGUuYzojaWYgQ09ORklHXzY0QklUCm1hcGxlLmMtICAgICAgICBNVF9CVUdf
T04obXQsIGRhdGFfZW5kICE9IG1hc19kYXRhX2VuZCgmbWFzKSk7Cm1hcGxlLmMtI2VuZGlmCi0t
Cm1hcGxlLmM6I2lmIENPTkZJR182NEJJVAptYXBsZS5jLSAgICAgICAgTVRfQlVHX09OKG10LCBk
YXRhX2VuZCAtIDIgIT0gbWFzX2RhdGFfZW5kKCZtYXMpKTsKbWFwbGUuYy0jZW5kaWYKLS0KbWFw
bGUuYzojaWYgQ09ORklHXzY0QklUCm1hcGxlLmMtICAgICAgICBNVF9CVUdfT04obXQsIGRhdGFf
ZW5kIC0gNCAhPSBtYXNfZGF0YV9lbmQoJm1hcykpOwptYXBsZS5jLSNlbmRpZgotLQptYXBsZS5j
OiNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkKbWFwbGUuYy0gICAgICAgIC8qIENhcHR1cmVzIGZy
b20gVk1zIHRoYXQgZm91bmQgcHJldmlvdXMgZXJyb3JzICovCm1hcGxlLmMtICAgICAgICBtdF9p
bml0X2ZsYWdzKCZ0cmVlLCAwKTsKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CgpGaXJzdCwgd2UgZG9uJ3QgaW50cm9kdWNlIHJ2NjRp
bHAzMi1hYmkgdXNlciBzcGFjZSwgd2hpY2ggbWVhbnMgdGhlc2UKdGVzdGluZyBjb2RlcyBjYW4n
dCBydW4gb24gcnY2NGlscDMyLWFiaSB1c2Vyc3BhY2UgY3VycmVudGx5LiBTbywgdGhlCnByb2Js
ZW0geW91IG1lbnRpb25lZCBkb2Vzbid0IGV4aXN0LgoKU2Vjb25kLCBDT05GSUdfMzJCSVQgaXMg
ZGV0ZXJtaW5lZCBieSBMT05HX0JJVCwgc28gdGhlcmUncyBubyBpc3N1ZSBpbgptYXBsZS5jIHdp
dGggZnV0dXJlIHJ2NjRpbHAzMi1hYmkgdXNlcnNwYWNlLgpUaGF0IG1lYW5zIHJ2NjRpbHAzMi1h
YmkgdXNlcnNwYWNlIHdvdWxkIHVzZSBDT05GSUdfMzJCSVQgdG8gdGVzdApyYWRpeC10cmVlLiBJ
dCdzIG9rYXkuCgo+Cj4gVGhpcyByYWlzZXMgb3RoZXIgY29uY2VybnMgYXMgdGhlIGNvZGUgaXMg
Zm91bmQgd2l0aCBhIGdyZXAgY29tbWFuZCwgc28KPiBJJ20gbm90IHN1cmUgd2h5IGl0IHdhcyBt
aXNzZWQgYW5kIGlmIGFueXRoaW5nIGVsc2UgaXMgbWlzc2VkPwo+Cj4gSWYgeW91IGNvbnNpZGVy
IHRoaXMgZW1haWwgdG8gYmUgdGhlICh1bmFza2VkKSBxdWVzdGlvbiBhYm91dCB3aGF0IHRvIGRv
Cj4gaGVyZSwgdGhlbiBwbGVhc2UgQ0MgbWUsIHRoZSBtYWludGFpbmVyIG9mIHRoZSBmaWxlcyBp
bmNsdWRpbmcgdGhlIG9uZQo+IHlvdSBhcmUgdXBkYXRpbmcgaGVyZS4KPgo+IFRoYW5rIHlvdSwK
PiBMaWFtCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

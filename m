Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C5BC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTE3Uw+JsOX62/5iLebpZEfDoopLmrNss+yQabIzb9w=; b=ricfoRbV2AWAZs
	HucMAqswhu9osux7oYvy47U4oEPQVP77pApoTIz3TvWL8T+mb6RgOkAiBXVjk1fmd8PuCalnPoWqN
	XiAOxE6MzAzsUHUoxX7s9BSSI9XzcqvLw7rQyXS7kzj4rjosA4SsJq0g2EUgpOhCnhX+woU3g/7oC
	UAu+seDPuNkhRTXCV3LcaimUG6VHwc4M1qj9MdJRWMbWLd7zKIM9XwCNH0jeZTmXuyIGH61//erDV
	Fg5N8Wsk9GyUrlkT84HVsx4uKmpakFA8mLT9L3M/zIYJWIKNt/XeW3V5nd7/noJnftKCSSH8E5LoV
	WnCTO+TfSpvp8FzJJjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI8o-00000009hfa-2NJX;
	Mon, 13 Jul 2026 15:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI8j-00000009ha8-08ph;
	Mon, 13 Jul 2026 15:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B18014031D;
	Mon, 13 Jul 2026 15:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274AE1F000E9;
	Mon, 13 Jul 2026 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783954812;
	bh=L5fiDa/fj5SvXJxwaq/LucqFFHHfPASlU0kMK3p5WGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I32dqgWUovV+6UTILJ1hPHG2Ah6V3FEIqgUwNz1L1+KZaZO+6JFNk8EvIaPIJJWfW
	 Di059jpXLRPNzd9QD8Ca69U8jck7wMLlLgFoaHu0+HJD4LBLhMMbCQZnXwNQVF3uIy
	 TOtE78v+5HW4SmbfRldLFT8gF/ylN8dXQXev7l+Wlicvhjtqge00fO0AZ35gxp2axB
	 PojGQNZAunUwNBZVGMsSIrHAbqrVc+mEZwAChGzDDTC7pM6zl0BWaQaDkqkijOXhss
	 PoTM5bY5kPP/7zBrAZMkBOMLx6VqMiDnvf1eGAax3omJerdzIevFOpv2TS34dYBVaf
	 sSgYQ4PWAHEAQ==
Message-ID: <16e7eb78-f107-4f26-83a8-7e41924659e5@kernel.org>
Date: Mon, 13 Jul 2026 16:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 19/34] x86: power: use proper set_pXd() for generic
 compile-time folded patable in resume_one_md_table_init()
To: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org
Cc: linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-20-yeoreum.yun@arm.com>
 <595e5ba5-0bc4-4630-b8f0-8637298076ce@intel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <595e5ba5-0bc4-4630-b8f0-8637298076ce@intel.com>
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

T24gNy8xMy8yNiAxNjozOCwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gNy8xMy8yNiAwNjo1NSwg
WWVvcmV1bSBZdW4gd3JvdGU6Cj4+IEBAIC0xMzQsMTEgKzEyOSwxMiBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgcmVzdW1lX2luaXRfZmlyc3RfbGV2ZWxfcGFnZV90YWJsZShwZ2RfdCAqcGdfZGlyKQo+
PiAgewo+PiAgI2lmZGVmIENPTkZJR19YODZfUEFFCj4+ICAJaW50IGk7Cj4+ICsJcHVkX3QgKnB1
ZCA9IHB1ZF9vZmZzZXQocDRkX29mZnNldChwZ19kaXIsIDApLCAwKTsKPj4gIAo+PiAgCS8qIElu
aXQgZW50cmllcyBvZiB0aGUgZmlyc3QtbGV2ZWwgcGFnZSB0YWJsZSB0byB0aGUgemVybyBwYWdl
ICovCj4+ICAJZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1BHRDsgaSsrKQo+PiAtCQlzZXRfcGdk
KHBnX2RpciArIGksCj4+IC0JCQlfX3BnZChfX3BhKGVtcHR5X3plcm9fcGFnZSkgfCBfUEFHRV9Q
UkVTRU5UKSk7Cj4+ICsJCXNldF9wdWQocHVkICsgaSwKPj4gKwkJCV9fcHVkKF9fcGEoZW1wdHlf
emVyb19wYWdlKSB8IF9QQUdFX1BSRVNFTlQpKTsKPj4gICNlbmRpZgo+PiAgfQo+IAo+IElmIHRo
aXMgaXMgdGhlIHdheSBmb3J3YXJkLCBpdCdzIGdvaW5nIHRvIHJlcXVpcmUgdGhlIHJldHJhaW5p
bmcgb2Ygc29tZQo+IGF3ZnVsbHkgb2xkIGJyYWluIGNlbGxzLgo+IAo+IEl0IGFsc28gZG9lc24n
dCByZWFsbHkgcmVhZCBjb3JyZWN0bHkuIExvb3Agb3ZlciBlYWNoIFBHRCBlbnRyeToKPiAKPiAJ
Zm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1BHRDsgaSsrKQo+IAo+IC4uLiBhbmQgc2V0IGEgcHVk
Pwo+IAo+IAkJc2V0X3B1ZCguLi4pCgpUaGUgUFRSU19QRVJfUEdEIGlzIGluZGVlZCBhIG5hc3R5
IGFzcGVjdC4gTWF5YmUgd2UgY291bGQgY2xlYW4gdGhhdCB1cCB0bwpleGNsdXNpdmVseSB3b3Jr
IG9uIFBVRHMgaGVyZS4KCkl0J3MgYWxyZWFkeSBuYXN0eSB0b2RheSBpZiB5b3UgdGFrZSBhIGxv
b2sgYXQgZS5nLiwgcGF0Y2ggIzIyIHdoZXJlIHdlIGRvOgoKCXNldF9wZ2QocGdkLCBfX3BnZChf
X3BhKHBtZF90YWJsZSkgfCBfUEFHRV9QUkVTRU5UKSk7CgpPciBwYXRjaCAjMjU6CgoJaWYgKHBn
ZF92YWwocGdkKSAhPcK3MCkgewoJCXBtZF90ICpwbWQgPSAocG1kX3QgKilwZ2RfcGFnZV92YWRk
cihwZ2QpOwoKClNvIHllcywgd2Uga25vdyB0aGF0IHdlIHdhbnQgdG8gc2V0IGEgUE1EIGFscmVh
ZHkgaW4gdGhlc2UgY2FzZXMuIEFuZCB1c2luZyBhClBVRCBpcyB0aGUgbmF0dXJhbCBjaG9pY2Ug
OikKCgo+IAo+IEknbSBub3Qgc3VyZSBob3cgSSdkIGV2ZXIgbGVhcm4gdGhlIHJ1bGVzIHRvIHdy
aXRlIHRoaXMgY29kZSBmcm9tCj4gc2NyYXRjaC4gUmlnaHQgbm93LCB0aGUgY29kZSBzYXlzOiAi
VGhlIHBnZF90IGlzIHRoZSB0b3AgbGV2ZWwgb2YgdGhlCj4gcGFnZSB0YWJsZXMuIEkga25vdyB0
aGVyZSBhcmUgUFRSU19QRVJfUEdEIG9mIHRob3NlIHRvcCBsZXZlbCBlbnRyaWVzCj4gZW50cmll
cyBJIG5lZWQgdG8gJ3plcm8nLiIKPiAKPiBZb3UgZG9uJ3QgaGF2ZSB0byBrbm93IHdoYXQgaXMg
Zm9sZGVkLCBqdXN0IHRoYXQgeW91J3JlIGRlYWxpbmcgd2l0aCB0aGUKPiB0b3AgbGV2ZWwuCj4g
Cj4gQnV0ICp0aGlzKiBjb2RlIHNheXM6Cj4gCj4gMS4gVGhlIHBnZF90IGlzIHRoZSB0b3AgbGV2
ZWwgb2YgdGhlIHBhZ2UgdGFibGVzLiBTdGFydCB0aGVyZS4KPiAyLiAiV2FsayIgZG93biAqdHdv
KiAoZm9sZGVkKSBsZXZlbHMKPiAzLiBTZXQgdGhlIHRoaXJkLWxldmVsIChwdWQpIGVudHJpZXMg
dG8gJ3plcm8nCj4gCj4gU28gdGhlIGNvZGUgbm93ICpoYXMqIHRvIGtub3cgaG93IHRoZSBmb2xk
aW5nIG9jY3Vycy4KPiAKPiBUaGlzIHNlZW1zIHJlYWxseSBoYXJkIHRvIHdvcmsgd2l0aCB0byBt
ZS4KCkl0IGFsbCBnb2VzIGJhY2sgdG8gdGhlIGRlc2lnbiBjaG9pY2UgcGVvcGxlIG1hZGUgdG8g
c2F5IGZvciBmb2xkZWQgcDRkIHRoYXQKCgkxKSBQR0QgZW50cmllcyBhcmUgYWx3YXlzIHRyZWF0
ZWQgYXMgcHJlc2VudCBwYWdlIHRhYmxlIGVudHJpZXMuCgpzdGF0aWMgaW5saW5lIGludCBwZ2Rf
bm9uZShwZ2RfdCBwZ2QpICAgICAgICAgICB7IHJldHVybiAwOyB9CnN0YXRpYyBpbmxpbmUgaW50
IHBnZF9iYWQocGdkX3QgcGdkKSAgICAgICAgICAgIHsgcmV0dXJuIDA7IH0Kc3RhdGljIGlubGlu
ZSBpbnQgcGdkX3ByZXNlbnQocGdkX3QgcGdkKSAgICAgICAgeyByZXR1cm4gMTsgfQpzdGF0aWMg
aW5saW5lIHZvaWQgcGdkX2NsZWFyKHBnZF90ICpwZ2QpICAgICAgICB7IH0Kc3RhdGljIGlubGlu
ZSBib29sIHBnZF9sZWFmKHBnZF90IHBnZCkgICAgICAgICAgeyByZXR1cm4gZmFsc2U7IH0KCgky
KSBQNEQgZW50cmllcyBhcmUgYWN0dWFsbHkgd2hhdCB3ZSBpbnRlcnByZXQgbGF0ZXIuCgoKSXQg
a2luZC1vZiBtYWtlcyBzZW5zZSwgYmVjYXVzZSB0aGVuIHlvdSBoYXZlIGFsbCBvZiB0aGUgZm9s
ZGluZyBoYXBwZW5pbmcgIm9uCnRoZSB0b3AiLCBhbmQgbm90IHNvbWV3aGVyZSBkb3duIHRoZSBj
aGFpbi4KCkJ1dCB5ZXMsIGlkZWFsbHkgd2Ugd291bGRuJ3QgaGF2ZQoKI2RlZmluZSBQVFJTX1BF
Ul9QNEQgICAgICAgICAgICAxCgpJIHdvbmRlciBpZiB3ZSBjb3VsZCBjbGVhbiB0aGF0IHVwIC4u
LgoKClRoZSBnb29kIHRoaW5nIGlzLCB0aGF0IHRoZSBjb21waWxlciB3aWxsIGNvbXBsYWluIHRv
IHlvdSBpZiB5b3UgdXNlIHRoZSB3cm9uZwpzZXR0ZXIgbm93LgoKTm90ZSB0aGUgY29tbWVudHMg
d2UgcmVtb3ZlIGluIHBhdGNoICMyOToKCi8qCiAqIChwNGRzIGFyZSBmb2xkZWQgaW50byBwZ2Rz
IHNvIHRoaXMgZG9lc24ndCBnZXQgYWN0dWFsbHkgY2FsbGVkLAogKiBidXQgdGhlIGRlZmluZSBp
cyBuZWVkZWQgZm9yIGEgZ2VuZXJpYyBpbmxpbmUgZnVuY3Rpb24uKQogKi8KI2RlZmluZSBzZXRf
cGdkKHBnZHB0ciwgcGdkdmFsKSBzZXRfcDRkKChwNGRfdCAqKShwZ2RwdHIpLCAocDRkX3QpIHsg
cGdkdmFsIH0pCgoKRG9lc24ndCBhY3R1YWxseSBnZXQgY2FsbGVkLCByaWdodD8gOykKCi0tIApD
aGVlcnMsCgpEYXZpZAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK

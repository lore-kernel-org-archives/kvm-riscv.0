Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B3C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdS+DQSJr70v8EC3o6e4ZdVieEwr/54mN7FH2DqDEMI=; b=h71xGRVuF4VX90LqTCHwbETl05
	MqCVJITfB9zlt5IHRS7bdLwmLPLClpnxJQlsVQM1XX7oni7SQpI182mB34r5kyE38AqsWu8S8kpZF
	eWFybrY9PLyr8ML2MvsK8f4vsAwjLZvJVMcS/vDBDErr4+fzGZIvPclDXZ657co4BZ6H+x4Uqu/52
	xgCa6i3fpdAav2LI9qTK3lq+10Bf4k+gpP+wDvgCV/UY5gWhsi3A21m/wpVp/7hqH8iRqR7IGxkfC
	UG3KbRrAvk6DXuiJwsrEQ81SlrkmlC0zK+62M4O1ckEsZFdLKj5cF3RqybmSmpKD5anh62rdLG93L
	g7WLjqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n2a-0000000F7SK-1SPr;
	Wed, 02 Sep 2026 15:38:20 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n2X-0000000F7Rj-3II5;
	Wed, 02 Sep 2026 15:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788363498; x=1819899498;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=Gto3Qh9GMb9NHfU1pyqgYrGFpm2eBmgKaVe1oFr7GaI=;
  b=PzBcRtp53Ezhk9sOb6M9jXxPwto4DQVNbXYm88g4CtnBUVsswv9Jgulk
   kEDaTxN2Pke0ETRHMpXR6WVLgV9qOXZnVJT4SOnYp5hSLZiZBP71y5u3z
   fKTchPNks0dmPjeyDP2iY/40OaemQOH+moWkwaO0hwqBhHKs7gyIYrZft
   jhgDk6gB5IjDBaZA+UtnQh8zFxjXx3lNhu/cz9VgAESfIOtiuuhlFCxkM
   ZbOaR3qpvYrvWvOeT2eJJVxnOlXe7NcLA0KwrSuEopA15R2hMA5nZPrib
   nG2bL1NMOmJ7mZmHI0YsesKzR1/1pbPtdkqQbTMi1KV0I5B4OxsPpCvn0
   Q==;
X-CSE-ConnectionGUID: wFX0QE7vRwis9+r2EMrGCA==
X-CSE-MsgGUID: ZNWL90XpTPedewhfIMVecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100180366"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100180366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 08:38:14 -0700
X-CSE-ConnectionGUID: 8hpX5srJT06kHQYkOTw48Q==
X-CSE-MsgGUID: me7HS4XpTWOWoZkBSbYO+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268126784"
Received: from cjhill-mobl.amr.corp.intel.com (HELO [10.125.110.134]) ([10.125.110.134])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 08:38:13 -0700
Content-Type: multipart/mixed; boundary="------------4S7eK5PTldGor8W3n9zFHezW"
Message-ID: <fa4acc56-9742-4a5e-abd4-7491ad426940@intel.com>
Date: Wed, 2 Sep 2026 08:38:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 15/21] x86: mm: skip collapse_pud_page() when
 CONFIG_X86_DIRECT_GBPAGES disabled
To: Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-openrisc@vger.kernel.org
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
 <20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083817_850608_2AB0FF07 
X-CRM114-Status: GOOD (  27.14  )
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
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------4S7eK5PTldGor8W3n9zFHezW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 04:56, Yeoreum Yun wrote:
> The behaviour of pXd_page() will change with generic compile-time folded
> page tables by disallowing its use and triggering a compile-time error
> when it's used improperly, ensuring that the actual pXd_page() is used
> instead.
> 
> To prepare fot that, skip collapse_pud_page() when
> CONFIG_X86_DIRECT_GBPAGES is disabled.

Nit: this doesn't explain how the change actually fixes anything or what
the specific problem being solved is.

I think you want to say something along the lines of:

	collapse_pud_page() uses pud_page() in a way which will soon
	trigger a compile-time error on configs that have a folded pud.

	The code which will generate that error is actually unreachable
	on those configs because 'direct_gbpages' is always 0 there.
	However, the compiler does not know that because
	'direct_gbpages' is a normal integer from a separate compilation
	unit.

	Make the compiler aware when most of collapse_pud_page() is
	unreachable by adding a Kconfig check. This ensures it will not
	trip the errors when they are introduced. It probably also trims
	the kernel image down a wee bit too as a side benefit.

Maybe I should just merge something like the attached patch. I think it
would solve your problem and make things generally cleaner too.
--------------4S7eK5PTldGor8W3n9zFHezW
Content-Type: text/x-patch; charset=UTF-8;
 name="direct_gbpages-compiletime.patch"
Content-Disposition: attachment; filename="direct_gbpages-compiletime.patch"
Content-Transfer-Encoding: base64

ClRoZXJlIGlzIGFuIGV4aXN0aW5nIHZhcmlhYmxlIChkaXJlY3RfZ2JwYWdlcykgdGhhdCBz
YXlzIHdoZXRoZXIgdGhlCmtlcm5lbCBjYW4gYW5kIHNob3VsZCB1c2UgMUcgcGFnZXMgaW4g
dGhlIGRpcmVjdCBtYXAuIEl0IGlzIGRyaXZlbgpieSBhIGJ1bmNoIG9mIG90aGVyIG1hY2hp
bmVyeS4gQXQgbGVhc3Q6CgogMS4gSGFyZHdhcmUgc3VwcG9ydCBmb3IgMUcgcGFnZXMKIDIu
IEtjb25maWcgc3VwcG9ydCBmb3IgMUcgZGlyZWN0IG1hcHBpbmdzCiAzLiBLZXJuZWwgY29t
bWFuZCBsaW5lIG92ZXJyaWRlcwoKTW9zdCBjb2RlIGp1c3QgY2hlY2tzIHRoZSAnZGlyZWN0
X2dicGFnZXMnIHZhcmlhYmxlIGl0c2VsZi4gQnV0IHRoaXMKcHJldmVudHMgY29tcGlsZXIg
b3B0aW1pemF0aW9uIGluIGNhc2VzIHdoZXJlIDFHIG1hcHBpbmdzIGFyZQpjb21waWxlLXRp
bWUgZGlzYWJsZWQgKHZpYSBYODZfRElSRUNUX0dCUEFHRVMpLgoKQWRkIGEgaGVscGVyIHRv
IHJlcGxhY2UgJ2RpcmVjdF9nYnBhZ2VzJyBjaGVja3MuIENoZWNrIHRoZSBLY29uZmlnCm9w
dGlvbiBhbmQgYmFzZSBDUFUgc3VwcG9ydCBiZWZvcmUgbG9va2luZyBhdCB0aGUgdmFyaWFi
bGUuCgpUaGlzIGxldHMgdGhlIGNvbXBpbGVyIG9wdGltaXplIHRoaW5ncyBiZXR0ZXIsIGVz
cGVjaWFsbHkKY29sbGFwc2VfcHVkX3BhZ2UoKSB3aGVyZSBtb3N0IG9mIHRoZSBmdW5jdGlv
biBjYW4gbm93IGJlIG9wdGltaXplZAphd2F5LgoKLS0tCgogYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggICAgIHwgICAxNCArKysrKysrKysrKysrKwogYi9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L2NvbW1vbi5jICAgICAgIHwgICAgMiArLQogYi9hcmNoL3g4Ni9rZXJuZWwv
bWFjaGluZV9rZXhlY182NC5jIHwgICAgMiArLQogYi9hcmNoL3g4Ni9tbS9pbml0LmMgICAg
ICAgICAgICAgICAgIHwgICAgMiArLQogYi9hcmNoL3g4Ni9tbS9wYXQvc2V0X21lbW9yeS5j
ICAgICAgIHwgICAgNCArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC1wdU4gYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJs
ZS5ofmRpcmVjdF9nYnBhZ2VzLWNvbXBpbGV0aW1lIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmh+ZGlyZWN0X2di
cGFnZXMtY29tcGlsZXRpbWUJMjAyNi0wOS0wMiAwNjo1Mzo1Ny44MzU3MzMzOTggLTA3MDAK
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCTIwMjYtMDktMDIgMDg6MTc6
MDEuNDM0NzI3NzcxIC0wNzAwCkBAIC0xMTYzLDYgKzExNjMsMjAgQEAgc3RhdGljIGlubGlu
ZSBpbnQgcGdkX25vbmUocGdkX3QgcGdkKQogI2lmbmRlZiBfX0FTU0VNQkxFUl9fCiAKIGV4
dGVybiBpbnQgZGlyZWN0X2dicGFnZXM7CitzdGF0aWMgaW5saW5lIGJvb2wgZGlyZWN0X2di
cGFnZXNfZW5hYmxlZCh2b2lkKQoreworCS8qIENoZWNrIHRoZSBkaXJlY3QgbWFwIGNvbmZp
ZyBvcHRpb246ICovCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19YODZfRElSRUNUX0dCUEFH
RVMpKQorCQlyZXR1cm4gZmFsc2U7CisKKwkvKiBDaGVjayB0aGUgQ1BVIGZlYXR1cmU6ICov
CisJaWYgKCFjcHVfZmVhdHVyZV9lbmFibGVkKFg4Nl9GRUFUVVJFX0dCUEFHRVMpKQorCQly
ZXR1cm4gZmFsc2U7CisKKwkvKiBDaGVjayB0aGUgY29tbWFuZC1saW5lIGFuZCBlYXJseSBz
ZXR1cCB2YXJpYWJsZTogKi8KKwlyZXR1cm4gZGlyZWN0X2dicGFnZXM7Cit9CisKIHZvaWQg
aW5pdF9tZW1fbWFwcGluZyh2b2lkKTsKIHZvaWQgZWFybHlfYWxsb2NfcGd0X2J1Zih2b2lk
KTsKIHZvaWQgX19pbml0IHBva2luZ19pbml0KHZvaWQpOwpkaWZmIC1wdU4gYXJjaC94ODYv
bW0vaW5pdC5jfmRpcmVjdF9nYnBhZ2VzLWNvbXBpbGV0aW1lIGFyY2gveDg2L21tL2luaXQu
YwotLS0gYS9hcmNoL3g4Ni9tbS9pbml0LmN+ZGlyZWN0X2dicGFnZXMtY29tcGlsZXRpbWUJ
MjAyNi0wOS0wMiAwNjo1NTowMS4wMDQwOTQ5MjQgLTA3MDAKKysrIGIvYXJjaC94ODYvbW0v
aW5pdC5jCTIwMjYtMDktMDIgMDg6MjA6MzYuNzU5OTkyNTYyIC0wNzAwCkBAIC0yNTEsNyAr
MjUxLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2JlX3BhZ2Vfc2l6ZV9tYXNrKAogCQlf
X2RlZmF1bHRfa2VybmVsX3B0ZV9tYXNrICY9IH5fUEFHRV9HTE9CQUw7CiAKIAkvKiBFbmFi
bGUgMSBHQiBsaW5lYXIga2VybmVsIG1hcHBpbmdzIGlmIGF2YWlsYWJsZTogKi8KLQlpZiAo
ZGlyZWN0X2dicGFnZXMgJiYgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0dCUEFHRVMpKSB7
CisJaWYgKGRpcmVjdF9nYnBhZ2VzX2VuYWJsZWQoKSkgewogCQlwcmludGsoS0VSTl9JTkZP
ICJVc2luZyBHQiBwYWdlcyBmb3IgZGlyZWN0IG1hcHBpbmdcbiIpOwogCQlwYWdlX3NpemVf
bWFzayB8PSAxIDw8IFBHX0xFVkVMXzFHOwogCX0gZWxzZSB7CmRpZmYgLXB1TiBhcmNoL3g4
Ni9rZXJuZWwvY3B1L2NvbW1vbi5jfmRpcmVjdF9nYnBhZ2VzLWNvbXBpbGV0aW1lIGFyY2gv
eDg2L2tlcm5lbC9jcHUvY29tbW9uLmMKLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9jb21t
b24uY35kaXJlY3RfZ2JwYWdlcy1jb21waWxldGltZQkyMDI2LTA5LTAyIDA2OjU3OjQ3Ljkz
NTg0OTM5NyAtMDcwMAorKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCTIwMjYt
MDktMDIgMDY6NTc6NTcuMjk5NjE3NTM1IC0wNzAwCkBAIC0yNjYwLDcgKzI2NjAsNyBAQCB2
b2lkIF9faW5pdCBhcmNoX2NwdV9maW5hbGl6ZV9pbml0KHZvaWQpCiAJCSAqIFJpZ2h0IG5v
dyB3ZSBkb24ndCBkbyB0aGF0IHdpdGggZ2JwYWdlcyBiZWNhdXNlIHRoZXJlIHNlZW1zCiAJ
CSAqIHZlcnkgbGl0dGxlIGJlbmVmaXQgZm9yIHRoYXQgY2FzZS4KIAkJICovCi0JCWlmICgh
ZGlyZWN0X2dicGFnZXMpCisJCWlmICghZGlyZWN0X2dicGFnZXNfZW5hYmxlZCgpKQogCQkJ
c2V0X21lbW9yeV80aygodW5zaWduZWQgbG9uZylfX3ZhKDApLCAxKTsKIAl9IGVsc2Ugewog
CQlmcHVfX2luaXRfY2hlY2tfYnVncygpOwpkaWZmIC1wdU4gYXJjaC94ODYva2VybmVsL21h
Y2hpbmVfa2V4ZWNfNjQuY35kaXJlY3RfZ2JwYWdlcy1jb21waWxldGltZSBhcmNoL3g4Ni9r
ZXJuZWwvbWFjaGluZV9rZXhlY182NC5jCi0tLSBhL2FyY2gveDg2L2tlcm5lbC9tYWNoaW5l
X2tleGVjXzY0LmN+ZGlyZWN0X2dicGFnZXMtY29tcGlsZXRpbWUJMjAyNi0wOS0wMiAwNjo1
Nzo1OC40NjI3MTI5NzUgLTA3MDAKKysrIGIvYXJjaC94ODYva2VybmVsL21hY2hpbmVfa2V4
ZWNfNjQuYwkyMDI2LTA5LTAyIDA2OjU4OjA1LjIxOTI2NzUxNCAtMDcwMApAQCAtMjU3LDcg
KzI1Nyw3IEBAIHN0YXRpYyBpbnQgaW5pdF9wZ3RhYmxlKHN0cnVjdCBraW1hZ2UgKmkKIAkJ
aW5mby5rZXJucGdfZmxhZyB8PSBfUEFHRV9FTkM7CiAJfQogCi0JaWYgKGRpcmVjdF9nYnBh
Z2VzKQorCWlmIChkaXJlY3RfZ2JwYWdlc19lbmFibGVkKCkpCiAJCWluZm8uZGlyZWN0X2di
cGFnZXMgPSB0cnVlOwogCiAJZm9yIChpID0gMDsgaSA8IG5yX3Bmbl9tYXBwZWQ7IGkrKykg
ewpkaWZmIC1wdU4gYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuY35kaXJlY3RfZ2JwYWdl
cy1jb21waWxldGltZSBhcmNoL3g4Ni9tbS9wYXQvc2V0X21lbW9yeS5jCi0tLSBhL2FyY2gv
eDg2L21tL3BhdC9zZXRfbWVtb3J5LmN+ZGlyZWN0X2dicGFnZXMtY29tcGlsZXRpbWUJMjAy
Ni0wOS0wMiAwNjo1ODo0My41MTg0MTQ1NTUgLTA3MDAKKysrIGIvYXJjaC94ODYvbW0vcGF0
L3NldF9tZW1vcnkuYwkyMDI2LTA5LTAyIDA2OjU5OjI3LjI1MjAxNTM2OSAtMDcwMApAQCAt
MTMwLDcgKzEzMCw3IEBAIHZvaWQgYXJjaF9yZXBvcnRfbWVtaW5mbyhzdHJ1Y3Qgc2VxX2Zp
bGUKIAlzZXFfcHJpbnRmKG0sICJEaXJlY3RNYXA0TTogICAgJThsdSBrQlxuIiwKIAkJCWRp
cmVjdF9wYWdlc19jb3VudFtQR19MRVZFTF8yTV0gPDwgMTIpOwogI2VuZGlmCi0JaWYgKGRp
cmVjdF9nYnBhZ2VzKQorCWlmIChkaXJlY3RfZ2JwYWdlc19lbmFibGVkKCkpCiAJCXNlcV9w
cmludGYobSwgIkRpcmVjdE1hcDFHOiAgICAlOGx1IGtCXG4iLAogCQkJZGlyZWN0X3BhZ2Vz
X2NvdW50W1BHX0xFVkVMXzFHXSA8PCAyMCk7CiB9CkBAIC0xMzQwLDcgKzEzNDAsNyBAQCBz
dGF0aWMgaW50IGNvbGxhcHNlX3B1ZF9wYWdlKHB1ZF90ICpwdWQsCiAJcG1kX3QgKnBtZCwg
Zmlyc3Q7CiAJaW50IGk7CiAKLQlpZiAoIWRpcmVjdF9nYnBhZ2VzKQorCWlmICghZGlyZWN0
X2dicGFnZXNfZW5hYmxlZCgpKQogCQlyZXR1cm4gMDsKIAogCWFkZHIgJj0gUFVEX01BU0s7
Cl8K

--------------4S7eK5PTldGor8W3n9zFHezW
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--------------4S7eK5PTldGor8W3n9zFHezW--


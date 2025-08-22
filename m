Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9109ECA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJVE0kU58Iu6Eu12gIRKMUm+JrAa7OEeJWIB+Py+KMQ=; b=BrEEE9O2XMAMPp
	TJ+/Jk+dDrZ3XQW/2xDHyutiqh56kmNGSYCxZnDZAW5kCVFTWhsotRKRTTU5oWEPkWXP8LkOxNzn1
	hdq1LDplCWpn7dR2nUMiAqAIr72IaZdT+6zjNv/BGNMBMk7N5zaE/kSO03p07S2UD1hT/vPcK99iL
	xmGzwQQnjmK8oW0skQT8CVo5dE08KmA90BFjFqI/0Td/W61Mgm3O5MafQsur7KiMu2wxr3ZDpGBVn
	9ld+B9CL0GSJM9C+zphvpzlMajMlNC7IRn+49ow6wQPIUlBYTo3Ypym0gUiKhmnzctmHH0sn0+IIO
	x42CxRCEdVo9K6RLESJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpR-00000004487-1Qy2;
	Sat, 23 Aug 2025 06:34:17 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upP4w-00000002Cv9-1CSR
	for kvm-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 10:33:03 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3e570045e05so17581875ab.2
        for <kvm-riscv@lists.infradead.org>; Fri, 22 Aug 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755858781; x=1756463581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpW5veLMLPdr6OKMte0tGA4PuK4ym/yIcC2Y9SUMkpQ=;
        b=BQD2VNoaAvRwlQX3l7UcD8bkMlj0S6fJIDz1ZXNrMOIHS52bgvaP411ln1wzIRZFOA
         0EfHRWlpeM/rBiejfKha/l4sJZyy9XPaB6ZIgvRlhcjCKVZFpJevl5nxxtDLgaIymuSc
         xj6Ts0riLERBs19ufFyt7MS8F8s9Xp+JsWOeKy9voYiAVbe0IK9Ek5FY4KsTMe7Lzenk
         6JkzibKqxP9PWie8Q3gVIk/WQ/I22zN+oCDDmruUeJQtNg4QUcASthK6d16UM+FbEzDL
         CFe5cMs3YmfVQARuJCaKG1osmEqyu2iGMM/fvc2pfiKNyv2Pbi5GMfjpJ1To/mRVpWxq
         Qnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858781; x=1756463581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpW5veLMLPdr6OKMte0tGA4PuK4ym/yIcC2Y9SUMkpQ=;
        b=iObjb4Ld3WewgBW3rtUcuPHzPB3+7a2xSbuk7U+U3vNDyffJAdTRg7DBOy5I2bruOy
         5VE9VUepwkpGbXCLQJcvmDVA0f+PGo/3W94XDqBjVWaitiPi1Off53dL7rhU6lPse5xY
         gQgaot6/c8ZnaQVEoo2mQLeVMpBF6XEKYT7d15ACIdw77mn6l968/S4EYkYPRQ+Dw4Kj
         L4mX7fDDxe6nsshzK4ZirJAAxYTMYE4hC5iGA0Rr7GLUpgX+DhKjDrHMHe8Z0ucPxtWO
         AFFe6Z/MEVZ50EDRkhExhPx36ICgdMNBKpCDqM31tc39FKwCdcuvL3WxZzl4FCxuTvjm
         CPeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDc4fqNbOYJ96vEOk9JO769gHxLWyaleGARVAE9eTYLIaByy1eJowa8z8THZHwHuFztUvvk3E6qk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLRDZxR2He4m/AkIs33GScuVqNeZGjcsKJhDJ0E/Ar6xReUrcB
	O9hf4DJKdCCV6oWlsyOJfE2YjnBzwYPo9h3bLRTrgxkdMp7hJuOEq3JjHFox/VdsPbx9J4hTX6b
	R0zDhG0r/MYwwJIXJX6sQGtVmmMn/hfRnNbJoDAYK4g==
X-Gm-Gg: ASbGnctFdFfzSbooSwd5Lh++uHebjVIzFPDB4KX1nZpEMpXGzBYKJPz1x4uSBWqPuCa
	+rlWA5VOFam2fkw4/8vUsPqMyG9BEYDpgKwY4CeTCWmVRdK6US53IeIBI8RvIwAnuSwOXIoAhhS
	JTn5URTwsEOHx98eQbRO0JSuN8UD2T+Wf92dC/6UR8n/y1jkS6PlgJ94ZwYFYmx1p42AYNC0CoU
	gJFU6SB
X-Google-Smtp-Source: AGHT+IFxa3sIYy8GmbrliB9vOURhQsISjHNbjP8q123c5R9HRTAMf+tU9qbPOd1N7VsCfi+G9RwFcCmvT1G6Qpsac28=
X-Received: by 2002:a05:6e02:1607:b0:3e3:fd25:f6a with SMTP id
 e9e14a558f8ab-3e921a5c447mr39155945ab.11.1755858780756; Fri, 22 Aug 2025
 03:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-17-seanjc@google.com>
In-Reply-To: <20250806195706.1650976-17-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:02:49 +0530
X-Gm-Features: Ac12FXz94_OmeQku-x70DMZyHIHAiBydPtfIxKmb7IUME7_u-QmNy8EiX87dBF4
Message-ID: <CAAhSdy3Ee1K7kfwFUhdcjoe+c4oi06Tm+Jo7CE2ycqHjuBou-A@mail.gmail.com>
Subject: Re: [PATCH v5 16/44] KVM: Add a simplified wrapper for registering
 perf callbacks
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_033302_573433_87EEF8B4 
X-CRM114-Status: GOOD (  19.10  )
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

T24gVGh1LCBBdWcgNywgMjAyNSBhdCAxOjI34oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgcGFyYW1ldGVyLWxlc3MgQVBJIGZvciBy
ZWdpc3RlcmluZyBwZXJmIGNhbGxiYWNrcyBpbiBhbnRpY2lwYXRpb24gb2YKPiBpbnRyb2R1Y2lu
ZyBhbm90aGVyIHg4Ni1vbmx5IHBhcmFtZXRlciBmb3IgaGFuZGxpbmcgbWVkaWF0ZWQgUE1VIFBN
SXMuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6
CkFja2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51
cAoKPiAtLS0KPiAgYXJjaC9hcm02NC9rdm0vYXJtLmMgICAgICB8ICAyICstCj4gIGFyY2gvbG9v
bmdhcmNoL2t2bS9tYWluLmMgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgIHwg
IDIgKy0KPiAgYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaCAgfCAxMSArKysrKysrKystLQo+ICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAg
ICAgIHwgIDUgKysrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL2FybS5jIGIvYXJjaC9h
cm02NC9rdm0vYXJtLmMKPiBpbmRleCA4ODhmN2M3YWJmNTQuLjZjNjA0YjUyMTRmMiAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2t2bS9hcm0uYwo+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2FybS5j
Cj4gQEAgLTIzMjgsNyArMjMyOCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRfc3Vic3lzdGVt
cyh2b2lkKQo+ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4K
PiAtICAgICAgIGt2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyhOVUxMKTsKPiArICAgICAgIGt2
bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcygpOwo+Cj4gIG91dDoKPiAgICAgICAgIGlmIChlcnIp
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2t2bS9tYWluLmMgYi9hcmNoL2xvb25nYXJj
aC9rdm0vbWFpbi5jCj4gaW5kZXggODBlYTYzZDQ2NWI4Li5mNjIzMjZmZTI5ZmEgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL21haW4uYwo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2t2
bS9tYWluLmMKPiBAQCAtMzk0LDcgKzM5NCw3IEBAIHN0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF9l
bnZfaW5pdCh2b2lkKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBrdm1faW5pdF9nY3NyX2ZsYWco
KTsKPiAtICAgICAgIGt2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyhOVUxMKTsKPiArICAgICAg
IGt2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcygpOwo+Cj4gICAgICAgICAvKiBSZWdpc3RlciBM
b29uZ0FyY2ggSVBJIGludGVycnVwdCBjb250cm9sbGVyIGludGVyZmFjZS4gKi8KPiAgICAgICAg
IHJldCA9IGt2bV9sb29uZ2FyY2hfcmVnaXN0ZXJfaXBpX2RldmljZSgpOwo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCA2
N2M4NzZkZTc0ZWYuLmNiZTg0MmMyZjYxNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9t
YWluLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBAQCAtMTU5LDcgKzE1OSw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2t2bV9pbml0KHZvaWQpCj4gICAgICAgICAgICAgICAg
IGt2bV9pbmZvKCJBSUEgYXZhaWxhYmxlIHdpdGggJWQgZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0
c1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKTsK
Pgo+IC0gICAgICAga3ZtX3JlZ2lzdGVyX3BlcmZfY2FsbGJhY2tzKE5VTEwpOwo+ICsgICAgICAg
a3ZtX3JlZ2lzdGVyX3BlcmZfY2FsbGJhY2tzKCk7Cj4KPiAgICAgICAgIHJjID0ga3ZtX2luaXQo
c2l6ZW9mKHN0cnVjdCBrdm1fdmNwdSksIDAsIFRISVNfTU9EVUxFKTsKPiAgICAgICAgIGlmIChy
Yykgewo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2
LmMKPiBpbmRleCA1YWYyYzVhZWQwZjIuLmQ4MGJiZDVlMDg1OSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3g4Ni9rdm0veDg2LmMKPiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKPiBAQCAtOTY4OSw3ICs5
Njg5LDcgQEAgaW50IGt2bV94ODZfdmVuZG9yX2luaXQoc3RydWN0IGt2bV94ODZfaW5pdF9vcHMg
Km9wcykKPiAgICAgICAgICAgICAgICAgc2V0X2h2X3RzY2NoYW5nZV9jYihrdm1faHlwZXJ2X3Rz
Y19ub3RpZmllcik7Cj4gICNlbmRpZgo+Cj4gLSAgICAgICBrdm1fcmVnaXN0ZXJfcGVyZl9jYWxs
YmFja3Mob3BzLT5oYW5kbGVfaW50ZWxfcHRfaW50cik7Cj4gKyAgICAgICBfX2t2bV9yZWdpc3Rl
cl9wZXJmX2NhbGxiYWNrcyhvcHMtPmhhbmRsZV9pbnRlbF9wdF9pbnRyLCBOVUxMKTsKPgo+ICAg
ICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0tWTV9TV19QUk9URUNURURfVk0pICYmIHRkcF9t
bXVfZW5hYmxlZCkKPiAgICAgICAgICAgICAgICAga3ZtX2NhcHMuc3VwcG9ydGVkX3ZtX3R5cGVz
IHw9IEJJVChLVk1fWDg2X1NXX1BST1RFQ1RFRF9WTSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IDE1NjU2
YjdmYmE2Yy4uMjBjNTBlYWEwMDg5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IEBAIC0xNzMxLDEwICsxNzMx
LDE3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1fYXJjaF9pbnRjX2luaXRpYWxpemVkKHN0cnVj
dCBrdm0gKmt2bSkKPiAgI2lmZGVmIENPTkZJR19HVUVTVF9QRVJGX0VWRU5UUwo+ICB1bnNpZ25l
ZCBsb25nIGt2bV9hcmNoX3ZjcHVfZ2V0X2lwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4KPiAt
dm9pZCBrdm1fcmVnaXN0ZXJfcGVyZl9jYWxsYmFja3ModW5zaWduZWQgaW50ICgqcHRfaW50cl9o
YW5kbGVyKSh2b2lkKSk7Cj4gK3ZvaWQgX19rdm1fcmVnaXN0ZXJfcGVyZl9jYWxsYmFja3ModW5z
aWduZWQgaW50ICgqcHRfaW50cl9oYW5kbGVyKSh2b2lkKSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZvaWQgKCptZWRpYXRlZF9wbWlfaGFuZGxlcikodm9pZCkpOwo+ICsK
PiArc3RhdGljIGlubGluZSB2b2lkIGt2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyh2b2lkKQo+
ICt7Cj4gKyAgICAgICBfX2t2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyhOVUxMLCBOVUxMKTsK
PiArfQo+ICsKPiAgdm9pZCBrdm1fdW5yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyh2b2lkKTsKPiAg
I2Vsc2UKPiAtc3RhdGljIGlubGluZSB2b2lkIGt2bV9yZWdpc3Rlcl9wZXJmX2NhbGxiYWNrcyh2
b2lkICppZ24pIHt9Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmVnaXN0ZXJfcGVyZl9jYWxs
YmFja3Modm9pZCkge30KPiAgc3RhdGljIGlubGluZSB2b2lkIGt2bV91bnJlZ2lzdGVyX3BlcmZf
Y2FsbGJhY2tzKHZvaWQpIHt9Cj4gICNlbmRpZiAvKiBDT05GSUdfR1VFU1RfUEVSRl9FVkVOVFMg
Ki8KPgo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21h
aW4uYwo+IGluZGV4IGVjYWZhYjJlMTdkOS4uZDQ3N2E3ZmRhMGFlIDEwMDY0NAo+IC0tLSBhL3Zp
cnQva3ZtL2t2bV9tYWluLmMKPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gQEAgLTY0Mjks
MTAgKzY0MjksMTEgQEAgc3RhdGljIHN0cnVjdCBwZXJmX2d1ZXN0X2luZm9fY2FsbGJhY2tzIGt2
bV9ndWVzdF9jYnMgPSB7Cj4gICAgICAgICAuaGFuZGxlX21lZGlhdGVkX3BtaSAgICA9IE5VTEws
Cj4gIH07Cj4KPiAtdm9pZCBrdm1fcmVnaXN0ZXJfcGVyZl9jYWxsYmFja3ModW5zaWduZWQgaW50
ICgqcHRfaW50cl9oYW5kbGVyKSh2b2lkKSkKPiArdm9pZCBfX2t2bV9yZWdpc3Rlcl9wZXJmX2Nh
bGxiYWNrcyh1bnNpZ25lZCBpbnQgKCpwdF9pbnRyX2hhbmRsZXIpKHZvaWQpLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAoKm1lZGlhdGVkX3BtaV9oYW5kbGVyKSh2
b2lkKSkKPiAgewo+ICAgICAgICAga3ZtX2d1ZXN0X2Nicy5oYW5kbGVfaW50ZWxfcHRfaW50ciA9
IHB0X2ludHJfaGFuZGxlcjsKPiAtICAgICAgIGt2bV9ndWVzdF9jYnMuaGFuZGxlX21lZGlhdGVk
X3BtaSA9IE5VTEw7Cj4gKyAgICAgICBrdm1fZ3Vlc3RfY2JzLmhhbmRsZV9tZWRpYXRlZF9wbWkg
PSBtZWRpYXRlZF9wbWlfaGFuZGxlcjsKPgo+ICAgICAgICAgcGVyZl9yZWdpc3Rlcl9ndWVzdF9p
bmZvX2NhbGxiYWNrcygma3ZtX2d1ZXN0X2Nicyk7Cj4gIH0KPiAtLQo+IDIuNTAuMS41NjUuZ2Mz
MmNkMTQ4M2ItZ29vZwo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=

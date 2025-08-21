Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FDECA0EFA
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VF5ODJ8sdzYMZbzMJpy5fsQtU6TclAflpMwSlheauY=; b=2qnnrdTsKxHW1Y
	yAgCfySMpbL445w98XHfaSIdCPw/oAUCpqkCY3ERTm0gkqZIAza3W7iXXQG7JS6JE1WK0rO1dY8/D
	g+00xgZNwiBbwTq9iNbR0djaodSiAmPBeDjiRGQMA2A6k0OaAx3DGHRUOyOhy1HowLGoW56JUw6f/
	pn5aPchabbwtKGpSP3yZnLkqiMINUi7NEVf55Sc9HlVOmSsIiesWQxbhrW1sLaSC0qsbJHFIp9xax
	teu33Fzgdg5wlCRb3j6NyTG7JUQVs80iLWtU2DqGpIHhMxGYNuk1NjHg6MUr5TVP7aB8mTQ8OKvz3
	3rlSsGy40ofzCNcUQplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8K-0000000Fetd-17ha;
	Thu, 21 Aug 2025 03:38:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uov44-0000000FXuR-1MnN;
	Thu, 21 Aug 2025 02:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A3CE453E6;
	Thu, 21 Aug 2025 02:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC13BC19423;
	Thu, 21 Aug 2025 02:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755743406;
	bh=hubpUThmEzsghOP3D/C7Zn97GmCl6Og8IXTCNTfgLvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgpcCjoDMNUJIiTimGJ/mSX+xldZOsAnLnNqwF4NlWkUeXtn7yC2TU0isXNO0CHsQ
	 2eW9LUlt8AZA2oZUZC5W/DWZ7XDa2K0f0Ok2yJBgI6TJETMuvrGwAnv5S1ruR0Vf8b
	 +bxXtIEdKJmFVJC2Z8JxcOUYUnKUlCZrlHvjQVYaPvmyruWnWkkHk026lXNPH2oQKj
	 VJjUG/y1dwm24ZnaECYiK4orHWE4JLOfBdjG6IkoMa/OzVuNdgFlDaK9O6pKtEAfvZ
	 gdBkcwCWGp7SA9iurNC9hfUKPU1bJvY7PinPbAcHMab5AXriGAtxW9RBrjvXIPQLij
	 0yXXknvCxA5PA==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so3227185e9.0;
        Wed, 20 Aug 2025 19:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9wpCy6McbfLI1al1+GsPsqRBC3H6onaaq5kQ31BPN2q1sxkQxB7fwDzUtTHgzci0sP4xfx9u2Sj1TGd8=@lists.infradead.org, AJvYcCVC1bAf7fGAwlVGojJfnnBcTlU8a2vF0FiAl042bb5pF7jSQPZvKChDey7NmqQl0m04nq0jNMp5YMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYcMyT/Mrbca5Ipp8CzFZ9Te745VYUwfG2nAw8xMj8fi5ttnzy
	SPw3UtzgmXzx448YniIDWAbwSZx0yING7DqH6aESObtSdXEAxG9sjUwf68PbQmbmWDQF3LzxqD1
	pi98D5/IpADxAZiI57v8/NnuklLJmZHg=
X-Google-Smtp-Source: AGHT+IGYX4eEyPphK+rf6VYqExLd5m/PEgZbk79xQHbEyvtKvfzfhnDjWrlazH1kSQ3/wuGNLwSYdViL32OHBPoQlXg=
X-Received: by 2002:a05:600c:4587:b0:456:302:6dc3 with SMTP id
 5b1f17b1804b1-45b4d858a37mr4606865e9.26.1755743404380; Wed, 20 Aug 2025
 19:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
 <20250820125952.71689-3-fangyu.yu@linux.alibaba.com> <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
 <CAJF2gTRR0LTO-CbUMkyXisov3BeftN+UJzv99GX7KfqCxWxmUg@mail.gmail.com>
In-Reply-To: <CAJF2gTRR0LTO-CbUMkyXisov3BeftN+UJzv99GX7KfqCxWxmUg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Aug 2025 10:29:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT9Py=wE9eHfY-i-cvoPatwFvRHq2dH1xznyX+GM8BxQw@mail.gmail.com>
X-Gm-Features: Ac12FXw_adGCNVjgTV_UXKrfw26y_tUOuHc9MjDbq3ZDuenvMG1Bo2H0ToRcxCg
Message-ID: <CAJF2gTT9Py=wE9eHfY-i-cvoPatwFvRHq2dH1xznyX+GM8BxQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V KVM: Remove unnecessary HGATP csr_read
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_193008_409454_7ECA3FF6 
X-CRM114-Status: GOOD (  28.28  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgOToyNeKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDIwLCAyMDI1IGF0IDEwOjQw4oCvUE0gVHJveSBN
aXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5kZXY+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
QXVnIDIwLCAyMDI1IGF0IDA4OjU5OjUyUE0gKzA4MDAsIGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbSB3cm90ZToKPiA+ID4gRnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIg
PGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBUaGUgSEdBVFAgaGFzIGJlZW4gc2V0IHRv
IHplcm8gaW4gZ3N0YWdlX21vZGVfZGV0ZWN0KCksIHNvIHRoZXJlCj4gPiA+IGlzIG5vIG5lZWQg
dG8gc2F2ZSB0aGUgb2xkIGNvbnRleHQuIFVuaWZ5IHRoZSBjb2RlIGNvbnZlbnRpb24KPiA+ID4g
d2l0aCBnc3RhZ2VfbW9kZV9kZXRlY3QoKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5jIHwgNSArLS0tLQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdm1pZC5jIGIvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCj4g
PiA+IGluZGV4IDVmMzM2MjVmNDA3MC4uYWJiMWMyYmYyNTQyIDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92bWlkLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCj4g
PiA+IEBAIC0yNSwxNSArMjUsMTIgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyh2bWlkX2xvY2sp
Owo+ID4gPgo+ID4gPiAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX2RldGVjdCh2
b2lkKQo+ID4gPiAgewo+ID4gPiAtICAgICB1bnNpZ25lZCBsb25nIG9sZDsKPiA+ID4gLQo+ID4g
PiAgICAgICAvKiBGaWd1cmUtb3V0IG51bWJlciBvZiBWTUlEIGJpdHMgaW4gSFcgKi8KPiA+ID4g
LSAgICAgb2xkID0gY3NyX3JlYWQoQ1NSX0hHQVRQKTsKPiA+ID4gICAgICAgY3NyX3dyaXRlKENT
Ul9IR0FUUCwgKGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA8PCBIR0FUUF9NT0RFX1NISUZUKSB8IEhH
QVRQX1ZNSUQpOwo+ID4gPiAgICAgICB2bWlkX2JpdHMgPSBjc3JfcmVhZChDU1JfSEdBVFApOwo+
ID4gPiAgICAgICB2bWlkX2JpdHMgPSAodm1pZF9iaXRzICYgSEdBVFBfVk1JRCkgPj4gSEdBVFBf
Vk1JRF9TSElGVDsKPiA+ID4gICAgICAgdm1pZF9iaXRzID0gZmxzX2xvbmcodm1pZF9iaXRzKTsK
PiA+ID4gLSAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgb2xkKTsKPiA+ID4gKyAgICAgY3NyX3dy
aXRlKENTUl9IR0FUUCwgMCk7Cj4gPiBJcyBzZXR0aW5nIEhHQVRQIHRvIDAgaW4gZ3N0YWdlX21v
ZGVfZGV0ZWN0IG1lYW5pbmdsZXNzIG5vdz8KPiA+IElmIHNvLCBpdCBtaWdodCBiZSBiZXR0ZXIg
dG8gZHJvcCBpdCBhbmQganVzdCBrZWVwIHRoZSBvbmUgaGVyZS4KPiBTb3JyeSwgSSBtaXN1bmRl
cnN0b29kIGhlcmUuCj4KPiAxLiBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfZGV0ZWN0KCkgJiBnc3Rh
Z2VfbW9kZV9kZXRlY3QoKSBhcmUgaW5kZXBlbnQKPiBmdW5jdGlvbiwgc28ga2VlcCBjc3Jfd3Jp
dGUoQ1NSX0hHQVRQLCAwKSBpcyBjb25zaWRlcmFibGUuCj4KPiAyLiBCdXQgeW91ciBpZGVhIGlz
IGdvb2QsIGJlY2F1c2UgY3NyX3dyaXRlKENTUl9IR0FUUCwgMCkgd291bGQgY2F1c2UKPiBUTEIg
Zmx1c2ggaW4gc29tZSBtaWNyby1hcmNoLCB3aGljaCByZWR1Y2VzIHRoZSBJUEMuIFNvLCByZW1v
dmluZwo+IHVubmVjZXNzYXJ5IENTUl93cml0ZSAoQ1NSX0hHQVRQLCAwKSBpcyBhbHNvIGNvbnNp
ZGVyYWJsZS4KPgo+IEkgd291bGQgdXBkYXRlIFY0IHRvIG1lcmdlIGt2bV9yaXNjdl9nc3RhZ2Vf
dm1pZF9kZXRlY3QoKSAmCj4gZ3N0YWdlX21vZGVfZGV0ZWN0KCkgaW50byBhIHNpbmdsZSBmdW5j
dGlvbiwgaW5zcGlyZWQgYnkgeW91ciBpZGVhLgpJIGZvdW5kIHdlIGNhbid0IHJlbW92ZSAiY3Ny
X3dyaXRlKENTUl9IR0FUUCwgMCkiIGluCmdzdGFnZV9tb2RlX2RldGVjdCgpLCBiZWNhdXNlIHRo
aXMgcGF0Y2ggbmVlZHMgdG8gcmVzZXQgdGhlIEhHQVRQIHdoZW4KbW9kZSBjaGVjayBmYWlsdXJl
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDgxOTAwNDY0My4xODg0
MTQ5LTEtZ3VvcmVuQGtlcm5lbC5vcmcvCgpJIHdvdWxkIHVwZGF0ZSB0byB2NCwgd2hpY2ggY29s
bGVjdHMgdGhlc2UgcmVsYXRlZCBwYXRjaGVzIHRvZ2V0aGVyCmZvciByZXZpZXcgY29udmVuaWVu
Y2UuCgo+Cj4gPgo+ID4gICAgICAgICAgICAgICAgIC0gVHJveQo+ID4KPiA+ID4KPiA+ID4gICAg
ICAgLyogV2UgcG9sbHV0ZWQgbG9jYWwgVExCIHNvIGZsdXNoIGFsbCBndWVzdCBUTEIgKi8KPiA+
ID4gICAgICAga3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV9ndm1hX2FsbCgpOwo+ID4gPiAtLQo+ID4g
PiAyLjQ5LjAKPiA+ID4KPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Cj4KPgo+IC0tCj4gQmVzdCBSZWdh
cmRzCj4gIEd1byBSZW4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

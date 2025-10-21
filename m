Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A71CCD184
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voMNeLvt3oWnoJ+NUtU89OnZjEM5d4Z+M416fcIQNwo=; b=j/06r+K3FjDJ9R
	ppkuqCErPy4mJ033nTe2JJd958AS5UXUKVtLXnsxhf85/amsVg1fREOZRLxGXwFgKz4I8beJWbi1e
	jaS/kSh8yga0cDRT2frcYwwHp3cDWNvyNGxl5+qsUQcgNzgK+IsOlXBaD1MI22RgN3pWx1lvt5LnU
	jLXIPKouRxOfYqq88DaQVeCxXgpMzTV9pQURTH/7mDmWACAxGj35U7JrNqz1Mpp8Gs1VSbS4B2awd
	WK4iCJHwFhlTU734ZU5FtGQLvj3qDEbocYmJSAqn55TSbIRvedA67/pCeOeoBudhm3jjVPZb7B9P0
	72ntUkwr6tOReMm0Yx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEHP-0000000HViL-1CJ2;
	Tue, 21 Oct 2025 15:28:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEHN-0000000HVhb-43kP
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 15:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D1E36250B
	for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 15:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7B1C19424
	for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761060485;
	bh=WMbjQNf+/6fBiKLcm2bw8S34Kgq52o5ZMkrYeVMZGuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HmuHWM1dCEMkQEuNjQv0XBBPq6oZ2G3mrQ+kjKzsLZyVNkVghb85j9HKAkAV4juMe
	 Ho8u+SFRQfAOiM7ZZMhfvby7fH7oCb752Ao37hwmuZuCUItwt49qVAq/gyxAlg4QAh
	 m+g8tkEK4KtxcQbJ4I/ZH8xVdimW6byRuvnLsAiin/r6F/ODnWKvl4az3Mm86iVmjZ
	 qKfHn/FKVbDkX2Uheh1wFOUkZ+WY4DJBYJdC7jFGQj64s3rBHuC5G/RWr19JhOPmyb
	 Vtb4KcS0MMkNxaybqMLncMbIRlzp/PDC9c9DLlu97TXS23tWuICJQmccrgfB1nCEfr
	 XryhxEP3J/BQw==
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so3414875e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:28:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGr4un/a4O9H2hCS9sgPi8eqV7M8Gkg7i274UrIt6REtBO83W1cA6vus2WFxHHlUPDfxprXMr7YkM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZjGss0yfT/8d9sWa3pkbZTT2qLzukoGoNClteC/BOiLMQDH8e
	4EP/1z9E8u5VQkE5yKM8JcLCPhsdZsYmqUC77C4pC2jX/OwlaScroaF5dYuRvC3mzGLDcYbBDV4
	JNh1l6/HiByHnMjWBnKC1X+57ElQP8vc=
X-Google-Smtp-Source: AGHT+IHRoCdSFqTwXlcQgKf1IBsD/W3re0yM+Mwfei0lXknc2hlfjdQNBmIPRhDMhPEHa/Lq+5tmuCu1/kOCqlcbuEE=
X-Received: by 2002:a05:600c:870e:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-4711791f94dmr163749325e9.34.1761060483386; Tue, 21 Oct 2025
 08:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Oct 2025 08:27:50 -0700
X-Gmail-Original-Message-ID: <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
X-Gm-Features: AS18NWAxsjIpybjWNUteC13IenF-VTwNuRsft_RJ2w2vZiotn8Q2h6SsETn4OI4
Message-ID: <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@nvidia.com, 
	alex.williamson@redhat.com
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgNjowOOKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBBcyBvZiBjb21taXQgYWFjNmRiNzVhOWZjICgidmZpby9wY2k6IFVzZSB1bm1h
cF9tYXBwaW5nX3JhbmdlKCkiKSwKPiB2bV9wZ29mZiBtYXkgbm8gbG9uZ2VyIGd1YXJhbnRlZWQg
dG8gaG9sZCB0aGUgUEZOIGZvciBWTV9QRk5NQVAKPiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bn
b2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+IHByb2R1Y2UgaW5jb3Jy
ZWN0IG1hcHBpbmdzLgo+Cj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJlZ2lvbnMg
Y2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRz
LCBtYWtpbmcgdGhlIHVwZnJvbnQgaW9yZW1hcCBpbiB0aGlzIHBhdGgKPiBpcyB1bm5lY2Vzc2Fy
eS4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdl
MiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikKVGhlIEZpeGVzIHRhZyBzaG91bGQgYmUgJ2NvbW1p
dCBhYWM2ZGI3NWE5ZmMgKCJ2ZmlvL3BjaTogVXNlCnVubWFwX21hcHBpbmdfcmFuZ2UoKSIpJy4K
CkEgc3RhYmxlIHRyZWUgbmVjZXNzaXRhdGVzIG1pbmltaXppbmcgdGhlICJGaXhlcyB0YWciIGlu
dGVyZmVyZW5jZS4KCldlIGFsc28gbmVlZCB0bwpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZp
ZGlhLmNvbT4KQ2M6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+
CkZvciByZXZpZXcuCgo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDIwICstLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2
L2t2bS9tbXUuYwo+IGluZGV4IDUyNWZiNWEzMzBjMC4uODRjMDRjOGYwODkyIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBA
QCAtMTk3LDggKzE5Nyw3IEBAIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3Ry
dWN0IGt2bSAqa3ZtLAo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogQSBtZW1vcnkgcmVnaW9u
IGNvdWxkIHBvdGVudGlhbGx5IGNvdmVyIG11bHRpcGxlIFZNQXMsIGFuZAo+IC0gICAgICAgICog
YW55IGhvbGVzIGJldHdlZW4gdGhlbSwgc28gaXRlcmF0ZSBvdmVyIGFsbCBvZiB0aGVtIHRvIGZp
bmQKPiAtICAgICAgICAqIG91dCBpZiB3ZSBjYW4gbWFwIGFueSBvZiB0aGVtIHJpZ2h0IG5vdy4K
PiArICAgICAgICAqIGFueSBob2xlcyBiZXR3ZWVuIHRoZW0sIHNvIGl0ZXJhdGUgb3ZlciBhbGwg
b2YgdGhlbS4KPiAgICAgICAgICAqCj4gICAgICAgICAgKiAgICAgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgICAgICAgICogKy0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tKyAgICstLS0tLS0tLS0tLS0tLS0tKwo+IEBAIC0yMjksMzIgKzIy
OCwxNSBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2
bSwKPiAgICAgICAgICAgICAgICAgdm1fZW5kID0gbWluKHJlZ19lbmQsIHZtYS0+dm1fZW5kKTsK
Pgo+ICAgICAgICAgICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1BGTk1BUCkgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdwYV90IGdwYSA9IGJhc2VfZ3BhICsgKHZtX3N0YXJ0IC0g
aHZhKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBwYTsKPiAtCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgcGEgPSAocGh5c19hZGRyX3Qpdm1hLT52bV9wZ29mZiA8PCBQ
QUdFX1NISUZUOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhICs9IHZtX3N0YXJ0IC0gdm1h
LT52bV9zdGFydDsKPiAtCj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogSU8gcmVnaW9uIGRp
cnR5IHBhZ2UgbG9nZ2luZyBub3QgYWxsb3dlZCAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChuZXctPmZsYWdzICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gLQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9tbXVfaW9yZW1hcChrdm0s
IGdwYSwgcGEsIHZtX2VuZCAtIHZtX3N0YXJ0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB3cml0YWJsZSwgZmFsc2UpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKRGVmZXJpbmcgdGhlIGlvcmVtYXAgdG8gdGhlIGctc3RhZ2UgcGFnZSBmYXVsdCBsb29r
cyBnb29kIHRvIG1lLCBhcyBpdApzaW1wbGlmaWVzIHRoZSBpbXBsZW1lbnRhdGlvbiBoZXJlLgoK
QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICBodmEgPSB2bV9lbmQ7Cj4gICAgICAgICB9IHdoaWxlIChodmEg
PCByZWdfZW5kKTsKPgo+IC0gICAgICAgaWYgKGNoYW5nZSA9PSBLVk1fTVJfRkxBR1NfT05MWSkK
PiAtICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gLQo+IC0gICAgICAgaWYgKHJldCkKPiAtICAg
ICAgICAgICAgICAga3ZtX3Jpc2N2X21tdV9pb3VubWFwKGt2bSwgYmFzZV9ncGEsIHNpemUpOwo+
IC0KPiAgb3V0Ogo+ICAgICAgICAgbW1hcF9yZWFkX3VubG9jayhjdXJyZW50LT5tbSk7Cj4gICAg
ICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi41MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=

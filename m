Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A87C88E45
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2mT4nqVAhvjaDXnQJjU3cBY+Rbr+rTip+0pR++qtuw=; b=No6FeWPz+NWahQ
	Wg1tbArPnhjieVAd1Nq+YceJPs6ZRN2IDMl5TO6fP9OjeR1NymVVPtv0zL/LET+haWD84f/ik6DRO
	0RG1x0ta+niMwTB8nyFtsQIFOE75XDiSvYZkPCjk0DzM4kisUnZPVW6QERlGv/E71MYjCiecxsmUc
	NBTuC9Ixgq6RNkFtkaDHwIc2ysO4JdgDK+dzNURc6qp/7KgTX9WVt8DAp1h2wwup8bvwDW1IuBrus
	SPQL/5t4+Qg3UEHJu/gj5JXkt4ChFQs0Wqzz41uuFLlV7KoAgCcgUgg+swBWx/Br4V/0dnn/QTOnf
	Q78RB6dcaNZyY/eay9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vck-0000000G0w3-48ek;
	Fri, 11 Sep 2026 07:24:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vci-0000000G0uk-1XhH
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48436216a98so336484f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Sep 2026 00:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111474; cv=none;
        d=google.com; s=arc-20260327;
        b=abbu+qjRYrIwnLzDaV/+Rz/3AJv77fvR8271ZeimUkLZjm/FPzMWvcxpT2/HGnWVER
         h9EA680SKiZTcUvgXJz2FGocf102EJu+wrJiFSP5cK36E3x1NOtB9Wxuy6nOxBRA0N70
         hb/nDlzY+zlCUYJYqljv2LAzSQSlBmOh72Jo1h685dxCABT5F/HLZVTf9GXaaZdd4ADE
         Ei+Hs0h0Ab65b/kaqDuedXNjbhVPO+cDo4iJzavzO57rz7/serke/lj8y5bjK2mBTdRr
         UhEoXcL47izfOHKfVUcYqc9FJiX21zLIsUz+2SXXke5SSRPLgmRlNHoA9yEM86wpxiZG
         jaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        fh=QlCFlJmNOwoUxUnpdk0iDJFYLVzFdZtppx59uEbVIWU=;
        b=mMrnOA8TiMXDbypihOonxXdf6+7T4gYnlsPkg+Pm2Uoqot78U7kxTPpzPvA/RxVBKz
         gPIjS2NARZCYSrPpmnMWNnnF91/KmyFcEa5UHxZc54fGv+RyLrDICVQUxSwOVwtCzyod
         PXnrhqdGmElGjat784n6oVO5TTuGGHWDZVy/eYdhM5BhmCroyaG8ep5Bg0SDvz2643zB
         kJnUC8Y74998gmQic9V5Ob3je0no7Nc/oYMD2RQWtCXrgljrk3EnDsqUDnfS2NDqobuu
         S/37/Db2EsSXut0eVqRz9AfvZiWdWSkU0mg48DCwfPbgyEyTAkXagBS44zNYbvvUPfSa
         D2CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789111474; x=1789716274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        b=MTYhqxzEGs+ks085f7l3bydPVenLz5TpJ/4c9fxDnJ5M8uhqKb43OCzlHbX+GpSEr3
         tO4ZC0Zi3xywxpdg7Mk9xTSwHZYAUpqiqjORD1ntvsvkbB5pe8b6sriLVonfEogp9nYo
         Tlv+2GziTKcuMVpMXvdpXRmcZF2HPBE/y95UaCNRnSL+4dOykULmaju9MB8wfefjWwo8
         RqnHMgv4giM2ojHsrhv2SGhA99vxFck26YpHUoiUG1IG6aWOeIpjIGM+oxWXn0MA97zP
         T2JNbBcIUOlMAjQGA4CFUdujnERPgJaCuyuYenm5QJAJFLsjK/IerUA1zPn93v9sNqzy
         kRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111474; x=1789716274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGXL6SW2PjuwJeBInmK3rjKWbFZ1WqS2BCjkSdFQSww=;
        b=p0v3MMYYGy9JP7/V5MGSw/Hx420JwQtR8aty414GjAtpO6G9D5G6FelSS7YSYE2rST
         f/JyaXwL3T1zB4JHU0DCJCAnwZThGnU+t2JhtekBwDjlAs0bSq27XakWaewwATiR5o+D
         P99O6dnZsoByJs6PwI6PSjenD0P7voHpAEcjq0dyEX6pqO9ZMPq3wopxNVMufXiVdSkY
         RVxUObHjNAl6RdOXmIoRTIQz11OWfoCBP+9IeSxyFUjzjI4utGtchQwR0xsUjnD5gM+s
         GavIEJUZwb679U3i74DxJFFhaPG3NKND2s+TCk+j0BQiw97yOYpGlm/m7qh9SCeb8YmE
         V0hg==
X-Forwarded-Encrypted: i=1; AKwUvByHOU+uZk6F4PnhPTAhwadEdIx3p/mqeXV1QpydGYSoKpZ+gcdluqHl6cWSoBzUxU/iQJFOZS1mkOg=@lists.infradead.org
X-Gm-Message-State: AFuF++mX5bdJNNwkDT/dW12q9+ewuKptt4cpCVp2kWwBmNjlnREVftzf
	JohN39jrPLUqlWHsuJb6h9NLKxeFjR6hqQEf3Op1FiD7jZWU3DXb/HQnr3t4L90/9flXWuxZ7GT
	mm6mM+zWBexj5HqRHCLKkJJKs4Qs/sso2CgOGLiwYYA==
X-Gm-Gg: AYBFou3L9Kog2WqrcBq7rUivs2k9+p+3lIVmnN7tVWMkuYxf3iYNv2LkOONiOHUJ+V0
	BBSlKg+XxlIH1R0OhRtxRF+JVDEFoiZnt/XyI5JQWmbOSyZFADs9ZsbrPy7c+0MyWNBDByfLJ6R
	kyld9vNtx8aI81dEW8o2BX37pNOlKnEXOVUUxzw8fYEf63x/KXcLhb/lcZa1rzAonApuwEvVq9c
	zK45/u9ahifo5zDK2lU/tT0R5/vFgSVvUqxETbrY1gGZ6Vls7ijRRvQgG8ODkiWH+q1FT2aeR+u
	8btErkb56ruZaFFKj52QHzTMkWubunr2rcgarhjUNb4UctSjhmcoZhQRJ0EHeqYoYObKcVIJBUX
	+K98hhTOViPDBjWXaQJ3XIgM1AgfE+oT2eToSn1S2COrDxqFilBvedjxUeyCbMl+gjlHHiYWiuw
	==
X-Received: by 2002:a05:6000:2c10:b0:486:e8ec:f999 with SMTP id
 ffacd0b85a97d-486eafd5fbdmr3215110f8f.6.1789111474165; Fri, 11 Sep 2026
 00:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786512671.git.pengpeng@iscas.ac.cn> <38f87205419f328693bc6ab25ae78f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <38f87205419f328693bc6ab25ae78f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Sep 2026 12:54:22 +0530
X-Gm-Features: AcwNN1Ui109i9ET6WVNBUkTgCCDwwsHevBU9WciGYkKXECocq96-TkdibME6zPA
Message-ID: <CAAhSdy1vDFrNQAT4vfDrfAVmztt0qvKhL3SeTOab3DBHmxC4-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Validate AIA MMIO address ranges
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Guo Ren <guoren@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002436_461522_5159B564 
X-CRM114-Status: GOOD (  25.01  )
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTE6MDnigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFVzZXJzcGFjZSBzdXBwbGllcyB0aGUgQVBMSUMgYW5k
IHBlci12Q1BVIElNU0lDIGJhc2UgYWRkcmVzc2VzIHRocm91Z2gKPiB0aGUgQUlBIGRldmljZSBB
UEkuICBUaGUgYWRkcmVzcyBzZXR0ZXJzIGN1cnJlbnRseSByZWplY3Qgb25seQo+IG1pc2FsaWdu
ZWQgYWRkcmVzc2VzLgo+Cj4gVGhlIHJlZ2lvbnMgYXJlIGxhdGVyIHJlZ2lzdGVyZWQgb24gS1ZN
J3MgTU1JTyBidXMgd2l0aCBmaXhlZCBzaXplcy4gIEFuCj4gYWxpZ25lZCBiYXNlIG5lYXIgVTY0
X01BWCBjYW4gdGhlcmVmb3JlIHdyYXAgd2hlbiB0aGUgcmFuZ2UgZW5kIGlzCj4gZm9ybWVkLiAg
QSBsb3dlciBiYXNlIGNhbiBzdGlsbCBwbGFjZSB0aGUgcmFuZ2UgYmV5b25kIHRoZSBzZWxlY3Rl
ZAo+IGd1ZXN0IHN0YWdlLTIgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4gIGt2bV9pb19idXNfY21w
KCkgYXNzdW1lcyB0aGF0Cj4gcmVnaXN0ZXJlZCByYW5nZXMgZG8gbm90IHdyYXAuCj4KPiBWYWxp
ZGF0ZSB0aGUgY29tcGxldGUgaW50ZXJ2YWwgd2hlbiBhbiBhZGRyZXNzIGlzIHN0b3JlZC4gIFNp
bmNlCj4gS1ZNX0NBUF9WTV9HUEFfQklUUyBjYW4gY2hhbmdlIHRoZSBzZWxlY3RlZCBHUEEgd2lk
dGggYmVmb3JlIEFJQQo+IGluaXRpYWxpemF0aW9uLCB2YWxpZGF0ZSBldmVyeSBhZGRyZXNzIGFn
YWluIGJlZm9yZSByZWdpc3RlcmluZyB0aGUKPiBmaXJzdCBNTUlPIGRldmljZS4KPgo+IFJldHVy
biAtRUlOVkFMIGZvciBtaXNhbGlnbm1lbnQgb3IgYXJpdGhtZXRpYyBvdmVyZmxvdyBhbmQgLUUy
QklHIHdoZW4KPiB0aGUgZW5kIGV4Y2VlZHMgdGhlIHN0YWdlLTIgR1BBIGxpbWl0LCBmb2xsb3dp
bmcgdGhlIGFybTY0IFZHSUMKPiBhZGRyZXNzLXZhbGlkYXRpb24gY29udmVudGlvbi4KPgo+IEZp
eGVzOiA4OWQwMTMwNmUzNGQgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IGRldmljZSBpbnRlcmZh
Y2UgZm9yIEFJQSBpcnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBlbmdw
ZW5nQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA3
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2NiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiBp
bmRleCBlZmM3YzBiY2ZiYTkuLmU5NjlkYmRjNGI5NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS9haWFfZGV2aWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiBA
QCAtMTAsNyArMTAsOSBAQAo+ICAjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+ICAjaW5jbHVkZSA8
bGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oPgo+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3Qu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L292ZXJmbG93Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC91YWNj
ZXNzLmg+Cj4gKyNpbmNsdWRlIDxhc20va3ZtX2dzdGFnZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2
bV9pc2EuaD4KPgo+ICBzdGF0aWMgaW50IGFpYV9jcmVhdGUoc3RydWN0IGt2bV9kZXZpY2UgKmRl
diwgdTMyIHR5cGUpCj4gQEAgLTE0MiwxNyArMTQ0LDM3IEBAIHN0YXRpYyBpbnQgYWlhX2NvbmZp
ZyhzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgIHJldHVybiAw
Owo+ICB9Cj4KPiArc3RhdGljIGludCBhaWFfY2hlY2tfYWRkcl9yYW5nZShzdHJ1Y3Qga3ZtICpr
dm0sIHU2NCBhZGRyLCB1NjQgYWxpZ25tZW50LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTY0IHNpemUpCj4gK3sKPiArICAgICAgIHU2NCBlbmQ7Cj4gKwo+ICsgICAgICAgaWYg
KCFJU19BTElHTkVEKGFkZHIsIGFsaWdubWVudCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ICsKPiArICAgICAgIGlmIChjaGVja19hZGRfb3ZlcmZsb3coYWRkciwgc2l6ZSwg
JmVuZCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgICAgIGlm
IChlbmQgPiBrdm1fcmlzY3ZfZ3N0YWdlX2dwYV9zaXplKGt2bS0+YXJjaC5wZ2RfbGV2ZWxzKSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FMkJJRzsKPiArCj4gKyAgICAgICByZXR1cm4gMDsK
PiArfQo+ICsKPiAgc3RhdGljIGludCBhaWFfYXBsaWNfYWRkcihzdHJ1Y3Qga3ZtICprdm0sIHU2
NCAqYWRkciwgYm9vbCB3cml0ZSkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9haWEgKmFpYSA9
ICZrdm0tPmFyY2guYWlhOwo+ICsgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKHdyaXRl
KSB7Cj4gICAgICAgICAgICAgICAgIC8qIFdyaXRlcyBjYW4gb25seSBiZSBkb25lIGJlZm9yZSBp
cnFjaGlwIGlzIGluaXRpYWxpemVkICovCj4gICAgICAgICAgICAgICAgIGlmIChrdm1fcmlzY3Zf
YWlhX2luaXRpYWxpemVkKGt2bSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
QlVTWTsKPgo+IC0gICAgICAgICAgICAgICBpZiAoKmFkZHIgJiAoS1ZNX0RFVl9SSVNDVl9BUExJ
Q19BTElHTiAtIDEpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICsgICAgICAgICAgICAgICByZXQgPSBhaWFfY2hlY2tfYWRkcl9yYW5nZShrdm0sICphZGRyLCBL
Vk1fREVWX1JJU0NWX0FQTElDX0FMSUdOLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBLVk1fREVWX1JJU0NWX0FQTElDX1NJWkUpOwo+ICsgICAgICAgICAgICAg
ICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAg
ICAgICAgICAgICAgYWlhLT5hcGxpY19hZGRyID0gKmFkZHI7Cj4gICAgICAgICB9IGVsc2UKPiBA
QCAtMTY2LDYgKzE4OCw3IEBAIHN0YXRpYyBpbnQgYWlhX2ltc2ljX2FkZHIoc3RydWN0IGt2bSAq
a3ZtLCB1NjQgKmFkZHIsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqdmNwdTsKPiAg
ICAgICAgIHN0cnVjdCBrdm1fdmNwdV9haWEgKnZjcHVfYWlhOwo+ICsgICAgICAgaW50IHJldDsK
Pgo+ICAgICAgICAgdmNwdSA9IGt2bV9nZXRfdmNwdShrdm0sIHZjcHVfaWR4KTsKPiAgICAgICAg
IGlmICghdmNwdSkKPiBAQCAtMTc3LDggKzIwMCwxMCBAQCBzdGF0aWMgaW50IGFpYV9pbXNpY19h
ZGRyKHN0cnVjdCBrdm0gKmt2bSwgdTY0ICphZGRyLAo+ICAgICAgICAgICAgICAgICBpZiAoa3Zt
X3Jpc2N2X2FpYV9pbml0aWFsaXplZChrdm0pKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUJVU1k7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKCphZGRyICYgKEtWTV9ERVZfUklT
Q1ZfSU1TSUNfQUxJR04gLSAxKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArICAgICAgICAgICAgICAgcmV0ID0gYWlhX2NoZWNrX2FkZHJfcmFuZ2Uoa3ZtLCAq
YWRkciwgS1ZNX0RFVl9SSVNDVl9JTVNJQ19BTElHTiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgS1ZNX0RFVl9SSVNDVl9JTVNJQ19TSVpFKTsKPiArICAgICAg
ICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBtdXRleF9sb2NrKCZ2Y3B1LT5tdXRleCk7Cj4gQEAgLTE5
MSw2ICsyMTYsNDAgQEAgc3RhdGljIGludCBhaWFfaW1zaWNfYWRkcihzdHJ1Y3Qga3ZtICprdm0s
IHU2NCAqYWRkciwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBhaWFf
dmFsaWRhdGVfYWRkcl9yYW5nZXMoc3RydWN0IGt2bSAqa3ZtKQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qga3ZtX2FpYSAqYWlhID0gJmt2bS0+YXJjaC5haWE7Cj4gKyAgICAgICBzdHJ1Y3Qga3ZtX3Zj
cHVfYWlhICp2YWlhOwo+ICsgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1Owo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBpZHg7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIGlmIChh
aWEtPm5yX3NvdXJjZXMpIHsKPiArICAgICAgICAgICAgICAgaWYgKGFpYS0+YXBsaWNfYWRkciA9
PSBLVk1fUklTQ1ZfQUlBX1VOREVGX0FERFIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXQgPSBhaWFfY2hlY2tfYWRkcl9y
YW5nZShrdm0sIGFpYS0+YXBsaWNfYWRkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgS1ZNX0RFVl9SSVNDVl9BUExJQ19BTElHTiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0RFVl9SSVNDVl9BUExJQ19TSVpFKTsK
PiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1KGlkeCwg
dmNwdSwga3ZtKSB7Cj4gKyAgICAgICAgICAgICAgIHZhaWEgPSAmdmNwdS0+YXJjaC5haWFfY29u
dGV4dDsKPiArICAgICAgICAgICAgICAgaWYgKHZhaWEtPmltc2ljX2FkZHIgPT0gS1ZNX1JJU0NW
X0FJQV9VTkRFRl9BRERSKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ICsKPiArICAgICAgICAgICAgICAgcmV0ID0gYWlhX2NoZWNrX2FkZHJfcmFuZ2Uoa3ZtLCB2
YWlhLT5pbXNpY19hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBLVk1fREVWX1JJU0NWX0lNU0lDX0FMSUdOLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBLVk1fREVWX1JJU0NWX0lNU0lDX1NJWkUpOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
KyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBncGFf
dCBhaWFfaW1zaWNfcHBuKHN0cnVjdCBrdm1fYWlhICphaWEsIGdwYV90IGFkZHIpCj4gIHsKPiAg
ICAgICAgIHUzMiBoLCBsOwo+IEBAIC0yNDQsOSArMzAzLDkgQEAgc3RhdGljIGludCBhaWFfaW5p
dChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBpZiAoYWlhLT5ucl9pZHMgPCBhaWEtPm5yX3Nv
dXJjZXMpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLSAgICAgICAvKiBB
UExJQyBiYXNlIGlzIHJlcXVpcmVkIGZvciBub24temVybyBudW1iZXIgb2Ygc291cmNlcyAqLwo+
IC0gICAgICAgaWYgKGFpYS0+bnJfc291cmNlcyAmJiBhaWEtPmFwbGljX2FkZHIgPT0gS1ZNX1JJ
U0NWX0FJQV9VTkRFRl9BRERSKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAr
ICAgICAgIHJldCA9IGFpYV92YWxpZGF0ZV9hZGRyX3Jhbmdlcyhrdm0pOwo+ICsgICAgICAgaWYg
KHJldCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKCk5vIG5lZWQgZm9yIHRoaXMgY2hh
bmdlLgoKPgo+ICAgICAgICAgLyogR3JvdXAgaW5kZXggYml0cyBtdXN0IG5vdCBvdmVybGFwIGd1
ZXN0IGFuZCBIQVJUIGluZGV4IGJpdHMuICovCj4gICAgICAgICBpZiAoYWlhLT5ucl9ncm91cF9i
aXRzICYmCj4gQEAgLTI2MywxMiArMzIyLDYgQEAgc3RhdGljIGludCBhaWFfaW5pdChzdHJ1Y3Qg
a3ZtICprdm0pCj4gICAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShpZHgsIHZjcHUsIGt2bSkgewo+
ICAgICAgICAgICAgICAgICB2YWlhID0gJnZjcHUtPmFyY2guYWlhX2NvbnRleHQ7Cj4KPiAtICAg
ICAgICAgICAgICAgLyogSU1TSUMgYmFzZSBpcyByZXF1aXJlZCAqLwo+IC0gICAgICAgICAgICAg
ICBpZiAodmFpYS0+aW1zaWNfYWRkciA9PSBLVk1fUklTQ1ZfQUlBX1VOREVGX0FERFIpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gZmFpbF9jbGVhbnVwX2ltc2ljczsKPiAtICAgICAgICAgICAgICAgfQo+IC0K
CkRvbid0IGRyb3AgdGhpcyBjaGVjay4KCj4gICAgICAgICAgICAgICAgIC8qIEFsbCBJTVNJQ3Mg
c2hvdWxkIGhhdmUgbWF0Y2hpbmcgYmFzZSBQUE4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKGJh
c2VfcHBuID09IEtWTV9SSVNDVl9BSUFfVU5ERUZfQUREUikKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBiYXNlX3BwbiA9IGFpYV9pbXNpY19wcG4oYWlhLCB2YWlhLT5pbXNpY19hZGRyKTsKPiAt
LQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkKPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

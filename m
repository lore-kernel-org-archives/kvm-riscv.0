Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F97C3ABC3
	for <kvm-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPRTaoyIXi1lzba5wwhE4XQly5Enrp8hSSiDSSh8TcA=; b=E9Ps1fzoUUl/I9
	7OzJztuMaJeTrPZFAaW0PQrysbBMgHc7lIRjVp6Hei7/fmMQAJ2WIKsZW325NzFC2RZ6ouavzsmsH
	zYIUW9ButOLTEMuLVfhhon+l/Xgl7sa8ps/YKH0mxtg4qTByvph/PCNpMU7MxOaFfNmMGehnJi10K
	3UIHEA4GrHmM5TmNFF+xFcVH2Zvs49gL3Pv09SaWXeMmJsRo52Z8F2c7Y9K7L9CCiqvGjyxvfD8Lo
	owOnliMtpd8IAgCuxz1cPcELNPM8yGBFR/JygB60eOepZZf6yTps6fVeino4gcR+kgxTB99Jw0n5K
	BayMERxGputn/q+AH/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEneM-0000000CF13-0gkC;
	Tue, 13 May 2025 11:18:18 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEneJ-0000000CEz0-16ay
	for kvm-riscv@lists.infradead.org;
	Tue, 13 May 2025 11:18:16 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso295040239f.1
        for <kvm-riscv@lists.infradead.org>; Tue, 13 May 2025 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747135094; x=1747739894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO3XD8l6ux1EVBnvjNxNYVBqO7/BMtxK8+QVey7D+08=;
        b=xUqVyh4qK+ViomYS5Qb01QE9niXaldJfJQXtPN9tiWrQvC/6gbCiMpxk5vOmhaY+sm
         y7ok7I/d4f5YqGQr4JOKzAYJvnlnfofM2/lOI2az8owP9Kc2e9vQ+2Gb+lqkexBfK+6Q
         0PLFAf7SLWu6krNoxODbeUxRmoJ8CVg29YANhHwApwfy27xYkxqPNwJLTuhbKcP1QnD6
         jWzcKRmlz5GR9n/Ep35CnkWcannkr0QZZkF7fursMHfPiiCGLylV/iCQEDvUd0cJckYh
         dxfRfdCrtoenXysT22yoaN9t84Y5gsU4DyFOmX8W427T+o6wiSnYmZruZVkcAvjsbp7+
         W19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135094; x=1747739894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO3XD8l6ux1EVBnvjNxNYVBqO7/BMtxK8+QVey7D+08=;
        b=APaRq2s+UEQJf5prE81beLckyrik9uxJZt5fXaSXEOvuC1aU7rXOvevFgZxuBcggA3
         0/8l26dEIVcYdqNJ3SqU6WZ/YzL4/9hw5IbImbq3Nd2mOBTyMRvIy1Ily5sMreSgaJQZ
         W1betMke2FS3YpKnC6IokOS4RL0lQnCUNPMlTpG6sFFsjQ130FtbDDDGCtbg9cm+W8bL
         zalfxtNx+bIA16ZMo08/c0kRhej7s7erCrhuislAq5GCZV/oR1pxdBGTDaJcnKoYgItk
         CWHLTH5Ap5gYq0vfe4UU2rJAbNd1W6MWsjiL8p3EgRA+7k8dwX0grnvW0RtxA9eln197
         YjRw==
X-Forwarded-Encrypted: i=1; AJvYcCUhBw0iY+VNIO9xC7VvkRZ2Rr9YytcFm04owKzZFeIR3oRilRi/hmnh3JEQi2K3b9aQ/Ba+sKT1o6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOSbROYL2OPzwmbBWVmNvc4WwaCp5ROl0Z0OwTXdvAH+0axL/E
	1yFVQ+vzKgH7ytpHAlY5/OBg2ryFex37ZieZq4GAesNci/PPA4uyKjKQFycV3KbjhmaW4lLgPTS
	GHxo0Khb5sziV2DPU5g5XhKjcP6k0sowMKK6iiA==
X-Gm-Gg: ASbGncu9ECJy+uifqaEasVghy+RxwtDOQu4ZnkANwabZ6IJL4CVLNBQG5E3za1Ttyna
	KdtOhSFHOp53yzBjtx1YejicntfA/MYVbsUxvK8Rnigar3QrLeXFcF3ZiNQB4d3WyehW82tTxlF
	Yo7Axdc3VErB59mM0vr5dRVnXgFRJ7CGEieg==
X-Google-Smtp-Source: AGHT+IF0TFlq7FI2UFso/yWVI99zcgMhkSX+i8735DmLyH2X4sWMpcDOU2yubNACzzbHeqk7+uSqM/W5xKTfdB5E+cI=
X-Received: by 2002:a05:6e02:2282:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da7e1efc2amr168845325ab.11.1747135093673; Tue, 13 May 2025
 04:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250512180407.659015-1-mlevitsk@redhat.com> <20250512180407.659015-7-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-7-mlevitsk@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 May 2025 16:48:02 +0530
X-Gm-Features: AX0GCFuh9Grm7ZDwE_uX_FG0oRRGo90WBh2IG8oJVp8cnWQQL4gcnv0Sdw9D2vw
Message-ID: <CAAhSdy3H8LaDHJq6H0rFirsWhC8tnE+bWwmWFtO8Eag-kcXcSA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] RISC-V: KVM: use kvm_trylock_all_vcpus when
 locking all vCPUs
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sebastian Ott <sebott@redhat.com>, Shusen Li <lishusen2@huawei.com>, 
	Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Borislav Petkov <bp@alien8.de>, Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexander Potapenko <glider@google.com>, kvmarm@lists.linux.dev, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Atish Patra <atishp@atishpatra.org>, 
	Joey Gouly <joey.gouly@arm.com>, x86@kernel.org, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Andre Przywara <andre.przywara@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>, linux-riscv@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	kvm-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_041815_510303_6A024680 
X-CRM114-Status: GOOD (  17.52  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMTE6MzXigK9QTSBNYXhpbSBMZXZpdHNreSA8bWxldml0
c2tAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBVc2Uga3ZtX3RyeWxvY2tfYWxsX3ZjcHVzIGluc3Rl
YWQgb2YgYSBjdXN0b20gaW1wbGVtZW50YXRpb24gd2hlbiBsb2NraW5nCj4gYWxsIHZDUFVzIG9m
IGEgVk0uCj4KPiBDb21waWxlIHRlc3RlZCBvbmx5Lgo+Cj4gU3VnZ2VzdGVkLWJ5OiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltIExldml0
c2t5IDxtbGV2aXRza0ByZWRoYXQuY29tPgoKRm9yIEtWTSBSSVNDLVY6ClRlc3RlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9haWFfZGV2aWNlLmMgfCAzNCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IGluZGV4IDM5Y2QyNmFmNWE2OS4uNjMxNTgyMWYwZDY5IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IEBAIC0xMiwzNiArMTIsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hv
c3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPgo+IC1zdGF0aWMgdm9pZCB1bmxv
Y2tfdmNwdXMoc3RydWN0IGt2bSAqa3ZtLCBpbnQgdmNwdV9sb2NrX2lkeCkKPiAtewo+IC0gICAg
ICAgc3RydWN0IGt2bV92Y3B1ICp0bXBfdmNwdTsKPiAtCj4gLSAgICAgICBmb3IgKDsgdmNwdV9s
b2NrX2lkeCA+PSAwOyB2Y3B1X2xvY2tfaWR4LS0pIHsKPiAtICAgICAgICAgICAgICAgdG1wX3Zj
cHUgPSBrdm1fZ2V0X3ZjcHUoa3ZtLCB2Y3B1X2xvY2tfaWR4KTsKPiAtICAgICAgICAgICAgICAg
bXV0ZXhfdW5sb2NrKCZ0bXBfdmNwdS0+bXV0ZXgpOwo+IC0gICAgICAgfQo+IC19Cj4gLQo+IC1z
dGF0aWMgdm9pZCB1bmxvY2tfYWxsX3ZjcHVzKHN0cnVjdCBrdm0gKmt2bSkKPiAtewo+IC0gICAg
ICAgdW5sb2NrX3ZjcHVzKGt2bSwgYXRvbWljX3JlYWQoJmt2bS0+b25saW5lX3ZjcHVzKSAtIDEp
Owo+IC19Cj4gLQo+IC1zdGF0aWMgYm9vbCBsb2NrX2FsbF92Y3B1cyhzdHJ1Y3Qga3ZtICprdm0p
Cj4gLXsKPiAtICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqdG1wX3ZjcHU7Cj4gLSAgICAgICB1bnNp
Z25lZCBsb25nIGM7Cj4gLQo+IC0gICAgICAga3ZtX2Zvcl9lYWNoX3ZjcHUoYywgdG1wX3ZjcHUs
IGt2bSkgewo+IC0gICAgICAgICAgICAgICBpZiAoIW11dGV4X3RyeWxvY2soJnRtcF92Y3B1LT5t
dXRleCkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICB1bmxvY2tfdmNwdXMoa3ZtLCBjIC0g
MSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IC0gICAgICAgICAg
ICAgICB9Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgcmV0dXJuIHRydWU7Cj4gLX0KPiAtCj4g
IHN0YXRpYyBpbnQgYWlhX2NyZWF0ZShzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkK
PiAgewo+ICAgICAgICAgaW50IHJldDsKPiBAQCAtNTMsNyArMjMsNyBAQCBzdGF0aWMgaW50IGFp
YV9jcmVhdGUoc3RydWN0IGt2bV9kZXZpY2UgKmRldiwgdTMyIHR5cGUpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUVYSVNUOwo+Cj4gICAgICAgICByZXQgPSAtRUJVU1k7Cj4gLSAgICAgICBp
ZiAoIWxvY2tfYWxsX3ZjcHVzKGt2bSkpCj4gKyAgICAgICBpZiAoa3ZtX3RyeWxvY2tfYWxsX3Zj
cHVzKGt2bSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAgIGt2bV9m
b3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkgewo+IEBAIC02NSw3ICszNSw3IEBAIHN0YXRpYyBp
bnQgYWlhX2NyZWF0ZShzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCB1MzIgdHlwZSkKPiAgICAgICAg
IGt2bS0+YXJjaC5haWEuaW5fa2VybmVsID0gdHJ1ZTsKPgo+ICBvdXRfdW5sb2NrOgo+IC0gICAg
ICAgdW5sb2NrX2FsbF92Y3B1cyhrdm0pOwo+ICsgICAgICAga3ZtX3VubG9ja19hbGxfdmNwdXMo
a3ZtKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC0tCj4gMi40Ni4wCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

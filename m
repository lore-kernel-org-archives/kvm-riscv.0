Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46442C79FA0
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dR6bw1lRba+eL5NQiCZZFpBoIXHoDaB6K7hSx8JLFmA=; b=TgREjH6w6CtiRv
	MAymx5Lg8piDKtALSWsnrYI+ngz+Dmlbleh5oiqZsLYuAeZ+cTEFZYJ8Ns+HhoBoKYgUCSMKF+uCt
	brCsyKXRRq3yZfxRq0g+n3vlG9ERb6Egj6hV2Tib4EIk7rlleYrCLgDjZbR4C0wuKytI1ZRXTL3qK
	ob1lAmceQ7kS6sp+V2AGeX6r9l0o+YBOygH+ixZv09YCJurxg3ey23Y4HYGtWYFwoSboNTO8Zrc+H
	a++dMGweWjMlRU68yIdc2yhLDKtx1oGH6+/d2W+HVoRsXKkXg6Qnwcmj08qQuDHqcGsUDz5k0M6q3
	+sqLOObOJua1yO3X7xPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UeA-00000006G97-3U5x;
	Mon, 07 Sep 2026 08:24:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ue7-00000006G6i-13ie
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 08:24:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47de0093c42so3057106f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 07 Sep 2026 01:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769445; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXzdaAIoIpL8dpuLO2Iif1xdCJqWj/K5e5tDYPj7LYNAn3spoQ1zgRVXnyyPEikg4S
         tUeUe65QNxMT5tGRlAV2Gallbin3QwcW8t7l7dpbJShZ6OWQ+4mGook8YUMCjICEZsBX
         Tecr62ILzXs3PEzpRHxxk6YQrP+9gImKHfsboz5kdWkt80USDLTsIumRFNvGMiICgpK1
         58zFx86ztBvCV6h0L47F8giU3dWUHImTQkNxjC6BUZLlrGUgShK1tzz2bUcetAR7y2Xb
         yiuQw7l5vjdT1zLYhm/ICUoMd5nhuCPOfkqWlgFGOqTgnSzPpDG/jghj4wnbDGdIlJ0y
         BE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        fh=YojNUAwnyNg8P1qVIF2THGe8yKQZCkZy7WEP/cYslvw=;
        b=JkO5okc2dmaxKzb1jc+FqHw6XLUPheRuBS1O6yCVx+Qzjqz+n2cWXotyUVkAMSV+JV
         EuvFJyTgkRAak5MhX94kpQKQZJ0X6m/YEJ5/zwgFUhdjhQv6fG4L+0qHoL82EUv8+e7K
         JJ9uGnL5wSbYtnQoX50io8W7xewNfnqJ08MiSnl2A4FYBd1Dxw1kYRL60l8Arp3ztG15
         EFGCwXKi2Z9B5I1Czxydijyh++qbfaZs2RDizYrpCzWOvwov6Ne29nsGgD+dYQ6LFJEj
         c4AyorvpbeiO+KuzrsKZt1wQvZzUlxFjyoNUlbDj6SU1kUIAbRq/JIcUekANnpekjo3L
         7uBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788769445; x=1789374245; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=M0teZe9Dzlc0cLLpRLVcVC5P8FhsCY6tBRrF+n59FoPmufx3AcA8tZCsV2CQ4l4ewc
         N+I9srguHiQtST7ShDEjrE49qxYv0hl9moaSRm5vGol81Xtg6dZYgg+00DSTyipP4/aT
         X8BGw6cYM0AWb6U8kvoAxl8LGAOo8d9fPlUdVtwOGjyIcFk9z+uwJozoJH7fCuMqMXrb
         xr6RSlYlXWt5xY81JKpFYgA5ro5sWWk4loNqMTMircj8J342WlneUYxlctjuC67bED48
         w9wa5gahzimnDDe1dFe8ADX68YadItVgoGg8F1CWqHsZP3zlquMbE+u3XhhCh+SYDtsE
         2bsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769445; x=1789374245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=mcqHs5qI9oBPE9gXKsiC5AXzIEUGLy+BpORmcoczfrQRxmJK8A+fkvIYyey/P8cjic
         U7TpJoS37Dn8XxPK3rZwLcqqkbcdvgt0ezrVTuWyb51WFyZC+eZMzGAQLj1MFwoLPuJH
         jpOZvuc+D/Qpc/IFEKeQd0V6tGln4TG9fqWMj6t3TLafMvQgwdu+ESbV/o0Uoo1aTUtl
         kuvC9JutuIHQWIagQhQoA3qQcqavKHlwQ7NyO8Ghnqo7gF0n0E5whkDr3jTLUeiL4XmI
         uAEKU3VcUBk13cjg4sMi4mfrQyX3ys4E8uWOuAR2VPteIxtHzDTIbPGc14l8hU7q/0Mu
         fWSQ==
X-Forwarded-Encrypted: i=1; AKwUvByC658l/NPbtI29x/fUiB1ia8FWUok33Goe3BnUhXfNNnKfwe50wxIZnHekpQtWAM0dkfvFgRDW2nU=@lists.infradead.org
X-Gm-Message-State: AFuF++lligbH3tuIJdwjdLKBtN/JGhgcJIA3Vtz+tYXA1rfnsk5Trk/H
	7fsK6BsMctAgn0KqHUJRPjyb5eZpqpK8qEaeV4rpOt+VElDmYR8V8yNFhmnzKpKazR+INzLLiqr
	653uI0T7oKMg8JUYURCg2Eb1weNcWHSl+FfPmK8tDpQ==
X-Gm-Gg: AYBFou3R6oUxbUIrX3q1CItqsbvjPFvv+/JvgbQd+urrw4WJDwaNLr92tCVntLiwxj7
	jIQmGQKg6SJd2xziQ2yKwm2qmScbcpmDlrnnkFG2JGfBADxBYOEYZ/792Gx/vT+mC/YlV0hhW91
	vfmRxJikoVetdIC3t+lLVVIygWk5nnD3BaAg77cc04oRLjWxNriy16yxKNIPZvZ3PqtbxQ5m4hO
	uCPUc/4upuKFJUDInopLNMUQxA4av+c+OPj0fETcsUNTaYcUNHZx5z3NGTD0uG+cvCHxNBJ/fyP
	zh0Vkulh0hPhasTjpipLbDydOb5dDtBzCaUgeN37Wv2lR4uPDBttMwclTbqidfMt3GKlToisF5q
	TIPUYa3pgjixZeJIUEQb5tWxtmVMklmIvonammwhIYBBaFeOmgwVweg6EaAe/ks4=
X-Received: by 2002:a05:6000:2f82:b0:485:8c16:5ef7 with SMTP id
 ffacd0b85a97d-4858c166148mr18091871f8f.49.1788769445126; Mon, 07 Sep 2026
 01:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Sep 2026 13:53:53 +0530
X-Gm-Features: AcwNN1UOItNX8Zqa8yZNak7eVCaaP3xVxuE0lRNcn1acCna6Fm_hGPjVZ5FCvUw
Message-ID: <CAAhSdy1zxu0cGnvpZEq_mPYRj07m7a+TA_8f0-sa=Mu7xtXvjA@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_012407_335064_78B2EB26 
X-CRM114-Status: GOOD (  15.44  )
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

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCAxMDoxMeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEFkZCB2bV9hbGxvY19wYWdlX3RhYmxlX3BhZ2Vz
KCkgYW5kIHVzZSBpdCB0aHJvdWdob3V0IGFyY2ggY29kZSB0byByZXBsYWNlCj4gb3BlbiBjb2Rl
ZCBlcXVpdmFsZW50cy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Cj4gUmV2
aWV3ZWQtYnk6IEl0YXJ1IEtpdGF5YW1hIDxpdGFydS5raXRheWFtYUBmdWppdHN1LmNvbT4KPiBU
ZXN0ZWQtYnk6IEl0YXJ1IEtpdGF5YW1hIDxpdGFydS5raXRheWFtYUBmdWppdHN1LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KCkxH
VE0uCgpGb3IgS1ZNIFJJU0MtVjoKQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpSZWdhcmRzLApBbnVwCgoKPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUva3ZtX3V0aWwuaCAgICB8IDkgKysrKysrKy0tCj4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9saWIvYXJtNjQvcHJvY2Vzc29yLmMgfCA0ICstLS0KPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyB8IDQgKy0tLQo+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMgIHwgOCArKy0tLS0t
LQo+ICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91
dGlsLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbC5oCj4g
aW5kZXggZDlkMzlhODg5NGUyLi5jNTZmMzQyYjE2ZmQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWwuaAo+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsLmgKPiBAQCAtMTAxMywxMCArMTAxMywx
NSBAQCBzdGF0aWMgaW5saW5lIGdwYV90IHZtX3BoeV9wYWdlX2FsbG9jKHN0cnVjdCBrdm1fdm0g
KnZtLCBncGFfdCBtaW5fZ3BhLAo+ICAgICAgICAgcmV0dXJuIHZtX3BoeV9wYWdlc19hbGxvYyh2
bSwgMSwgbWluX2dwYSwgbWVtc2xvdCk7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIGdwYV90IHZt
X2FsbG9jX3BhZ2VfdGFibGVfcGFnZXMoc3RydWN0IGt2bV92bSAqdm0sIHNpemVfdCBucl9wYWdl
cykKPiArewo+ICsgICAgICAgcmV0dXJuIHZtX3BoeV9wYWdlc19hbGxvYyh2bSwgbnJfcGFnZXMs
IEtWTV9HVUVTVF9QQUdFX1RBQkxFX01JTl9QQUREUiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArfQo+ICsKPiAgc3Rh
dGljIGlubGluZSBncGFfdCB2bV9hbGxvY19wYWdlX3RhYmxlKHN0cnVjdCBrdm1fdm0gKnZtKQo+
ICB7Cj4gLSAgICAgICByZXR1cm4gdm1fcGh5X3BhZ2VfYWxsb2Modm0sIEtWTV9HVUVTVF9QQUdF
X1RBQkxFX01JTl9QQUREUiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+
bWVtc2xvdHNbTUVNX1JFR0lPTl9QVF0pOwo+ICsgICAgICAgcmV0dXJuIHZtX2FsbG9jX3BhZ2Vf
dGFibGVfcGFnZXModm0sIDEpOwo+ICB9Cj4KPiAgLyoKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9hcm02NC9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9saWIvYXJtNjQvcHJvY2Vzc29yLmMKPiBpbmRleCAwMTMyNWJmNGQzNmYu
LjJkY2FhMmM0YTAzOCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
bGliL2FybTY0L3Byb2Nlc3Nvci5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9hcm02NC9wcm9jZXNzb3IuYwo+IEBAIC0xMTUsOSArMTE1LDcgQEAgdm9pZCB2aXJ0X2Fy
Y2hfcGdkX2FsbG9jKHN0cnVjdCBrdm1fdm0gKnZtKQo+ICAgICAgICAgaWYgKHZtLT5tbXUucGdk
X2NyZWF0ZWQpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+IC0gICAgICAgdm0tPm1tdS5w
Z2QgPSB2bV9waHlfcGFnZXNfYWxsb2Modm0sIG5yX3BhZ2VzLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01F
TV9SRUdJT05fUFRdKTsKPiArICAgICAgIHZtLT5tbXUucGdkID0gdm1fYWxsb2NfcGFnZV90YWJs
ZV9wYWdlcyh2bSwgbnJfcGFnZXMpOwo+ICAgICAgICAgdm0tPm1tdS5wZ2RfY3JlYXRlZCA9IHRy
dWU7Cj4gIH0KPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGli
L3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNj
di9wcm9jZXNzb3IuYwo+IGluZGV4IGRlZDU0MjlmMzQ0OC4uYzE3NWRjZDE0MTE0IDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMK
PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5j
Cj4gQEAgLTY5LDkgKzY5LDcgQEAgdm9pZCB2aXJ0X2FyY2hfcGdkX2FsbG9jKHN0cnVjdCBrdm1f
dm0gKnZtKQo+ICAgICAgICAgaWYgKHZtLT5tbXUucGdkX2NyZWF0ZWQpCj4gICAgICAgICAgICAg
ICAgIHJldHVybjsKPgo+IC0gICAgICAgdm0tPm1tdS5wZ2QgPSB2bV9waHlfcGFnZXNfYWxsb2Mo
dm0sIG5yX3BhZ2VzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArICAgICAg
IHZtLT5tbXUucGdkID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgbnJfcGFnZXMpOwo+
ICAgICAgICAgdm0tPm1tdS5wZ2RfY3JlYXRlZCA9IHRydWU7Cj4gIH0KPgo+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiBpbmRleCBmYjlk
YWI5MmQ0ZDEuLjMzZjQ5ZDc0M2I1ZiAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3MzOTAvcHJvY2Vzc29yLmMKPiBAQCAtMjAsOSArMjAsNyBAQCB2b2lkIHZp
cnRfYXJjaF9wZ2RfYWxsb2Moc3RydWN0IGt2bV92bSAqdm0pCj4gICAgICAgICBpZiAodm0tPm1t
dS5wZ2RfY3JlYXRlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLSAgICAgICBncGEg
PSB2bV9waHlfcGFnZXNfYWxsb2Modm0sIFBBR0VTX1BFUl9SRUdJT04sCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBLVk1fR1VFU1RfUEFHRV9UQUJMRV9NSU5fUEFERFIsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+bWVtc2xvdHNbTUVNX1JFR0lP
Tl9QVF0pOwo+ICsgICAgICAgZ3BhID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgUEFH
RVNfUEVSX1JFR0lPTik7Cj4gICAgICAgICBtZW1zZXQoYWRkcl9ncGEyaHZhKHZtLCBncGEpLCAw
eGZmLCBQQUdFU19QRVJfUkVHSU9OICogdm0tPnBhZ2Vfc2l6ZSk7Cj4KPiAgICAgICAgIHZtLT5t
bXUucGdkID0gZ3BhOwo+IEBAIC0zOCw5ICszNiw3IEBAIHN0YXRpYyB1NjQgdmlydF9hbGxvY19y
ZWdpb24oc3RydWN0IGt2bV92bSAqdm0sIGludCByaSkKPiAgewo+ICAgICAgICAgdTY0IHRhZGRy
Owo+Cj4gLSAgICAgICB0YWRkciA9IHZtX3BoeV9wYWdlc19hbGxvYyh2bSwgIHJpIDwgNCA/IFBB
R0VTX1BFUl9SRUdJT04gOiAxLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm0tPm1lbXNsb3RzW01FTV9SRUdJT05fUFRdKTsKPiArICAgICAgIHRhZGRy
ID0gdm1fYWxsb2NfcGFnZV90YWJsZV9wYWdlcyh2bSwgcmkgPCA0ID8gUEFHRVNfUEVSX1JFR0lP
TiA6IDEpOwo+ICAgICAgICAgbWVtc2V0KGFkZHJfZ3BhMmh2YSh2bSwgdGFkZHIpLCAweGZmLCBQ
QUdFU19QRVJfUkVHSU9OICogdm0tPnBhZ2Vfc2l6ZSk7Cj4KPiAgICAgICAgIHJldHVybiAodGFk
ZHIgJiBSRUdJT05fRU5UUllfT1JJR0lOKQo+IC0tCj4gMi41NS4wLjk2Ni5nNjY3M2FjZWYzOC1n
b29nCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==

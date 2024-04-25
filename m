From: Shuah Khan <skhan@linuxfoundation.org>
Date: Thu, 25 Apr 2024 08:45:07 -0600
Subject: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
Message-ID: <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/25/24 08:12, Dan Carpenter wrote:
> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>> support for guest private memory can be added without needing an entirely
>> separate set of helpers.
>>
>> Note, this obviously makes selftests backwards-incompatible with older KVM
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> versions from this point forward.
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Is there a way we could disable the tests on older kernels instead of
> making them fail?  Check uname or something?  There is probably a
> standard way to do this...  It's these tests which fail.

They shouldn't fail - the tests should be skipped on older kernels.
If it is absolutely necessary to dd uname to check kernel version,
refer to zram/zram_lib.sh for an example.

thanks,
-- Shuah

